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
        TokenService tokenService, CareerDayContext context, 
        DbContextOptions<CareerDayContext> dbContextOptions) : BaseApiController
    {
        private readonly UserManager<User> _userManager = userManager;
        private readonly ILogger<AccountController> _logger = logger;
        private readonly TokenService _tokenService = tokenService;
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

        [Authorize(Roles = "Admin, FullLicenseUser, SurveyLicenseUser")]
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

        [Authorize(Roles = "Admin, FullLicenseUser, SurveyLicenseUser")]
        [HttpDelete("deleteSchoolUser/{id}")]
        public async Task<ActionResult> DeleteSchoolUser(string id)
        {
            var currentUser = await _userManager.GetUserAsync(User);

            var schoolUser = await _context.Users
                .FirstOrDefaultAsync(u => u.Id == id && u.LicenseId == currentUser.LicenseId);
            if (schoolUser == null) return NotFound();

            _context.Users.Remove(schoolUser);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting school administrator" });
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

        [Authorize(Roles = "Admin, FullLicenseUser, SurveyLicenseUser")]
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

        [Authorize(Roles = "Admin, FullLicenseUser, SurveyLicenseUser")]
        [HttpPut("updateSchoolUser")]
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
    }
}