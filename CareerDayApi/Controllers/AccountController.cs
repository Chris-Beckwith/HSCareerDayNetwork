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
    public class AccountController(UserManager<User> userManager, ILogger<AccountController> logger,
        TokenService tokenService, EmailService emailService, CareerDayContext context, 
        DbContextOptions<CareerDayContext> dbContextOptions) : BaseApiController
    {
        private readonly UserManager<User> _userManager = userManager;
        private readonly ILogger<AccountController> _logger = logger;
        private readonly TokenService _tokenService = tokenService;
        private readonly EmailService _emailService = emailService;
        private readonly CareerDayContext _context = context;
        private readonly DbContextOptions _dbContextOptions = dbContextOptions;

        [HttpPost("login")]
        public async Task<ActionResult<UserDto>> Login(LoginDto loginDto)
        {
            var user = await _userManager.FindByNameAsync(loginDto.Username);

            if (user == null || !await _userManager.CheckPasswordAsync(user, loginDto.Password))
                return Unauthorized();

            var loginUser = new UserDto
            {
                Email = user.Email,
                UserName = user.UserName,
                Event = user.EventId.HasValue ? await GetEventDetailsAsync(user.EventId) : null,
                License = user.License,
                Token = await _tokenService.GenerateToken(user)
            };

            if (loginUser.Event != null) {
                using var newContext = new CareerDayContext(_dbContextOptions);
                loginUser.Event.SurveyCompletePercent = await CalculateSurveyProgressAsync(loginUser.Event.Id, newContext);
            }

            return loginUser;
        }

        /**
         * Admin creates license and sends invite from frontend after receiving payment offline
         */
        [Authorize(Roles = "Admin")]
        [HttpPost("createLicense")]
        public async Task<ActionResult> CreateLicense([FromForm]CreateLicenseDto createLicenseDto)
        {
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
            var registrationUrl = "Test/" + token;
            var emailResponse = await _emailService
                .SendLicenseInvitation(invitation.Email, registrationUrl, invitation.ExpirationDate);

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
        [HttpPost]
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

        [Authorize(Roles = "Admin, FullLicenseUser")]
        [HttpPost("registerSchoolUser")]
        public async Task<ActionResult> RegisterSchoolUser([FromForm]RegisterDto registerDto)
        {
            try
            {
                if (registerDto.Password.Length > 128)
                {
                    return BadRequest("Password cannot exceed 128 characters");
                }

                var currentUser = await _userManager.GetUserAsync(User);

                var user = new User { 
                    Email = registerDto.Email,
                    UserName = registerDto.Username,
                    EventId = registerDto.EventId,
                    LicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId
                };

                var result = await _userManager.CreateAsync(user, registerDto.Password);

                if (!result.Succeeded)
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(error.Code, error.Description);
                    }

                    return ValidationProblem();
                }

                await _userManager.AddToRoleAsync(user, "SchoolUser");

                return StatusCode(201);
            }
            catch (System.Exception e)
            {
                return BadRequest(new ProblemDetails { Title = e.Message });
            }
        }

        [Authorize]
        [HttpGet("currentUser")]
        public async Task<ActionResult<UserDto>> GetCurrentUser()
        {
            var user = await _userManager.FindByNameAsync(User.Identity.Name);

            var currentUser = new UserDto
            {
                Email = user.Email,
                UserName = user.UserName,
                Event = user.EventId.HasValue ? await GetEventDetailsAsync(user.EventId) : null,
                License = user.License,
                Token = await _tokenService.GenerateToken(user)
            };

            if (currentUser.Event != null) {
                using var newContext = new CareerDayContext(_dbContextOptions);
                currentUser.Event.SurveyCompletePercent = await CalculateSurveyProgressAsync(currentUser.Event.Id, newContext);
            }

            return currentUser;
        }

        [Authorize(Roles = "Admin, FullLicenseUser")]
        [HttpGet("schoolUsers")]
        public async Task<ActionResult<List<User>>> GetSchoolUsers([FromQuery]UserParams userParams)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            var schoolUsers = (await _userManager.GetUsersInRoleAsync("SchoolUser"))
                .Where(u => u.LicenseId == currentLicenseId)
                .ToList();

            foreach (var user in schoolUsers)
            {
                user.Event = await _context.Events.Where(e => e.Id == user.EventId).FirstOrDefaultAsync();
            }

            var query = schoolUsers.AsQueryable()
                .Search(userParams.SearchTerm);

            var paginatedSchoolUsers = query
                .Skip((userParams.PageNumber - 1) * userParams.PageSize)
                .Take(userParams.PageSize)
                .ToList();

            var paginationMetaData = new PaginationMetaData
            {
                CurrentPage = userParams.PageNumber,
                TotalPages = (int)Math.Ceiling(query.Count() / (double)userParams.PageSize),
                PageSize = userParams.PageSize,
                TotalCount = query.Count()
            };

            Response.AddPaginationHeader(paginationMetaData);

            return paginatedSchoolUsers;
        }

        [HttpPut]
        [Authorize(Roles = "Admin, FullLicenseUser")]
        public async Task<ActionResult<User>> UpdateSchoolUser([FromForm] UpdateSchoolUserDto updateSchoolUserDto)
        {
            var user = await _userManager.FindByIdAsync(updateSchoolUserDto.Id);
            if (user == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (user.LicenseId != currentUser.LicenseId) return Forbid();

            var careerEvent = await _context.Events
                .FirstOrDefaultAsync(e => e.Id == updateSchoolUserDto.EventId && e.LicenseId == currentUser.LicenseId);

            if (careerEvent == null) return NotFound();

            user.EventId = careerEvent.Id;

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(user);

            return BadRequest(new ProblemDetails { Title = "Problem updating school admin" });
        }

        private async Task<Event> GetEventDetailsAsync(int? eventId) {
            return await _context.Events
                    .Where(e => e.Id == eventId)
                    .Include(e => e.EventPhase)
                    .Include(e => e.School).ThenInclude(s => s.Address)
                    .Include(s => s.Speakers).ThenInclude(c => c.Careers)
                    .Include(s => s.Speakers).ThenInclude(a => a.Address)
                    .Include(c => c.Careers)
                    .FirstOrDefaultAsync();
        }

        private static async Task<int> CalculateSurveyProgressAsync(int id, CareerDayContext context)
        {
            var totalStudents = await context.Students.Where(s => s.EventId == id).ToListAsync();
            var totalSubmissions = await context.Surveys.Where(s => s.Student.EventId == id).ToListAsync();

            if (totalSubmissions.Count == 0 || totalStudents.Count == 0) return 0;

            return (int)Math.Floor(
                (double)totalSubmissions.Count / totalStudents.Count * 100
            );
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