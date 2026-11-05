using System.Security.Cryptography;
using System.Text;
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using CareerDayApi.Extensions;
using CareerDayApi.RequestHelpers;
using CareerDayApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    public class LicenseController(UserManager<User> userManager, ILogger<LicenseController> logger,
        EmailService emailService, IConfiguration config, CareerDayContext context) : BaseApiController
    {
        private readonly UserManager<User> _userManager = userManager;
        private readonly ILogger<LicenseController> _logger = logger;
        private readonly EmailService _emailService = emailService;
        private readonly IConfiguration _config = config;
        private readonly CareerDayContext _context = context;

        private readonly string _licenseRegistrationUrl = "registration/";

        [Authorize(Roles = "Admin")]
        [HttpGet]
        public async Task<ActionResult<PagedList<License>>> GetLicenses([FromQuery] LicenseParams licenseParams)
        {
            //Not including everything, can add later or call different endpoint..
            var query = _context.Licenses
                .Search(licenseParams.SearchTerm)
                .Include(l => l.Users)
                .Include(l => l.Events).ThenInclude(e => e.School)
                .Include(l => l.Schools).ThenInclude(s => s.Address)
                .Include(l => l.Careers)
                .Include(l => l.Speakers);

            var licenses = await PagedList<License>.ToPagedList(query,
                licenseParams.PageNumber, licenseParams.PageSize);

            Response.AddPaginationHeader(licenses.MetaData);

            return licenses;
        }

        [AllowAnonymous]
        [HttpGet("licenseInvite/{hashToken}")]
        public async Task<ActionResult<LicenseInvitationDto>> LicenseInvite(string hashToken)
        {
            var tokenHash = HashToken(hashToken);

            var invitation = await _context.LicenseInvitations
                .Include(i => i.License)
                .FirstOrDefaultAsync(i => i.TokenHash == tokenHash);

            if (invitation == null) return NotFound();

            var invitationDto = new LicenseInvitationDto
            {
                Email = invitation.Email,
                ExpirationDate = invitation.ExpirationDate,
                UsedAt = invitation.UsedAt,
                License = invitation.License
            };
            
            return invitationDto;
        }

        /**
         * Admin creates license and sends invite from frontend after receiving payment offline
         */
        [Authorize(Roles = "Admin")]
        [HttpPost("createLicense")]
        public async Task<ActionResult> CreateLicense([FromForm]CreateLicenseDto createLicenseDto)
        {
            //Check for existing user with email
            var userExists = await _context.Users.AnyAsync(u => u.Email == createLicenseDto.Email);
            if (userExists)
            {
                return BadRequest(new ProblemDetails { Title = "User email already exists" });
            }

            var license = new License
            {
                Type = createLicenseDto.Type,
                Status = LicenseStatus.Active,
                StartDate = DateTime.UtcNow,
                ExpirationDate = createLicenseDto.ExpirationDate,
                MaxSchools = createLicenseDto.MaxSchools,
                MaxEvents = createLicenseDto.MaxEvents
            };

            _context.Licenses.Add(license);
            var licenseResult = await _context.SaveChangesAsync() > 0;

            if (!licenseResult)
            {
                _logger.LogError("Problem creating license for email: {email}", createLicenseDto.Email);
                return BadRequest(new ProblemDetails { Title = "Failed to create the license" });
            }

            var token = GenerateToken();
            var invitation = new LicenseInvitation
            {
                LicenseId = license.Id,
                Email = createLicenseDto.Email,
                TokenHash = HashToken(token),
                CreatedAt = DateTime.UtcNow,
                ExpirationDate = DateTime.UtcNow.AddDays(2)
            };

            _context.LicenseInvitations.Add(invitation);
            var inviteResult = await _context.SaveChangesAsync() > 0;

            if (!inviteResult)
            {
                _logger.LogError("Problem creating invite for email: {email}", createLicenseDto.Email);
                return BadRequest(new ProblemDetails { Title = "Failed to create the invite" });
            }

            //Send email
            var registrationUrl = _config["HostName"] + _licenseRegistrationUrl + token;
            var emailResponse = await _emailService
                .SendLicenseInvitation(invitation.Email, registrationUrl, license.Type, invitation.ExpirationDate);

            if (!emailResponse.Successful)
            {
                _logger.LogError("Failed to send license invitation to {email}: {Errors}",
                    invitation.Email,
                    string.Join(", ", emailResponse.ErrorMessages));
                //Need to build resend email batch job
                return BadRequest(new ProblemDetails { Title = "Failed to send invite email" });
            }

            return StatusCode(201);
        }

        /**
        * Admin creates additional invites for a license
        */
        [Authorize(Roles = "Admin")]
        [HttpPost("inviteOnly")]
        public async Task<ActionResult> CreateLicenseInvitation([FromForm]CreateLicenseInviteDto createLicenseInviteDto)
        {
            var license = await _context.Licenses.FindAsync(createLicenseInviteDto.LicenseId);

            if (license == null) return NotFound(new ProblemDetails { Title = "License not found" });
            if (license.Status != LicenseStatus.Active)
                return BadRequest(new ProblemDetails { Title = "License not active" });

            //expire existing license invites
            var existingInvites = await _context.LicenseInvitations
                .Where(i => i.LicenseId == license.Id 
                    && i.Email == createLicenseInviteDto.Email 
                    && i.UsedAt == null)
                .ToListAsync();

            foreach (var invite in existingInvites)
                invite.ExpirationDate = DateTime.UtcNow;

            var token = GenerateToken();

            var invitation = new LicenseInvitation
            {
                LicenseId = license.Id,
                Email = createLicenseInviteDto.Email,
                TokenHash = HashToken(token),
                CreatedAt = DateTime.UtcNow,
                ExpirationDate = DateTime.UtcNow.AddDays(2)
            };

            _context.LicenseInvitations.Add(invitation);
            var inviteResult = await _context.SaveChangesAsync() > 0;

            if (!inviteResult)
            {
                _logger.LogError("Problem creating invite for email: {email}", createLicenseInviteDto.Email);
                return BadRequest(new ProblemDetails { Title = "Failed to create the invite" });
            }

            //Send email
            var registrationUrl = _licenseRegistrationUrl + token;
            var emailResponse = await _emailService
                .SendLicenseInvitation(invitation.Email, registrationUrl, license.Type, invitation.ExpirationDate);

            return StatusCode(201);
        }

        [AllowAnonymous]
        [HttpPost("registerLicenseUserFromInvite")]
        public async Task<ActionResult> RegisterLicenseUserFromInvite([FromForm]RegisterLicenseUserDto registerLicenseUserDto)
        {
            //Pull invitation
            var tokenHash = HashToken(registerLicenseUserDto.InviteToken);

            var invitation = await _context.LicenseInvitations
                .Include(i => i.License)
                .FirstOrDefaultAsync(i => i.TokenHash == tokenHash);

            if (invitation == null)
                return BadRequest(new ProblemDetails { Title = "Invitation not found" });

            if (invitation.UsedAt != null || invitation.ExpirationDate < DateTime.UtcNow)
                return BadRequest(new ProblemDetails { Title = "Invitation no longer valid" });

            if (invitation.License.Status != LicenseStatus.Active)
                return BadRequest(new ProblemDetails { Title = "License no longer active" });

            //Register User
            var user = new User
            {
                UserName = registerLicenseUserDto.Username,
                Email = invitation.Email,
                LicenseId = invitation.LicenseId
            };

            var result = await _userManager.CreateAsync(user, registerLicenseUserDto.Password);

            if (!result.Succeeded)
            {
                _logger.LogError("Failed to register user with license: {user}, {license}", invitation.Email, invitation.LicenseId);
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(error.Code, error.Description);
                }

                return ValidationProblem();
            }

            _logger.LogInformation("License User successfully created: {userEmail}, {userName}, {licenseId}",
                user.Email, user.UserName, user.LicenseId);

            //Add Role
            var roleResult = await _userManager.AddToRoleAsync(user, 
                invitation.License.Type == LicenseType.Full ? "FullLicenseUser" : "SurveyLicenseUser");

            if (!roleResult.Succeeded)
            {
                _logger.LogError("Failed to add license user to role: {userEmail}, {licenseId}, {role}",
                    user.Email, user.LicenseId, invitation.License.Type);

                foreach (var error in roleResult.Errors)
                    ModelState.AddModelError(error.Code, error.Description);

                return ValidationProblem();
            }

            _logger.LogInformation("License User successfully added role: {role}", invitation.License.Type);

            //Complete Invitation
            invitation.UsedAt = DateTime.UtcNow;
            var invitationSaved = await _context.SaveChangesAsync() > 0;

            if (!invitationSaved)
            {
                _logger.LogError("Invitation failed to mark as used: {invite}", invitation.Id);
            }

            return StatusCode(201);
        }

        private static string HashToken(string token)
        {
            var hash = SHA256.HashData(Encoding.UTF8.GetBytes(token));
            return Convert.ToHexString(hash);
        }

        private static string GenerateToken()
        {
            return Convert.ToBase64String(RandomNumberGenerator.GetBytes(32))
                .Replace("+", "-")
                .Replace("/", "_")
                .Replace("=", "");
        }
    }
}