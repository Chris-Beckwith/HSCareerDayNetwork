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
    public class AccountController(UserManager<User> userManager,
        TokenService tokenService, CareerDayContext context, 
        DbContextOptions<CareerDayContext> dbContextOptions) : BaseApiController
    {
        private readonly UserManager<User> _userManager = userManager;
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
                Event = user.EventId.HasValue ? await GetEventDetailsAsync(user.EventId) : null,
                Token = await _tokenService.GenerateToken(user)
            };

            if (loginUser.Event != null) {
                using var newContext = new CareerDayContext(_dbContextOptions);
                loginUser.Event.SurveyCompletePercent = await CalculateSurveyProgressAsync(loginUser.Event.Id, newContext);
            }

            return loginUser;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("register")]
        public async Task<ActionResult> Register([FromForm]RegisterDto registerDto)
        {
            try
            {
                Event careerEvent = await _context.Events.Where(e => e.Id == registerDto.EventId).FirstOrDefaultAsync();

                var user = new User { Email = registerDto.Email, UserName = registerDto.Username, Event = careerEvent };

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
                Event = user.EventId.HasValue ? await GetEventDetailsAsync(user.EventId) : null,
                Token = await _tokenService.GenerateToken(user)
            };

            if (currentUser.Event != null) {
                using var newContext = new CareerDayContext(_dbContextOptions);
                currentUser.Event.SurveyCompletePercent = await CalculateSurveyProgressAsync(currentUser.Event.Id, newContext);
            }

            return currentUser;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("schoolUsers")]
        public async Task<ActionResult<List<User>>> GetSchoolUsers([FromQuery]UserParams userParams)
        {
            var schoolUsers = await _userManager.GetUsersInRoleAsync("SchoolUser");

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
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<User>> UpdateSchoolUser([FromForm] UpdateSchoolUserDto updateSchoolUserDto)
        {
            var user = await _userManager.FindByIdAsync(updateSchoolUserDto.Id);

            if (user == null) return NotFound();

            var careerEvent = await _context.Events.FindAsync(updateSchoolUserDto.EventId);

            if (careerEvent == null) return NotFound();

            user.Event = careerEvent;
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