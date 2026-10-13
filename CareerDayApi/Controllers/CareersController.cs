using AutoMapper;
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    [Authorize(Roles = "Admin, FullLicenseUser, SurveyLicenseUser")]
    public class CareersController(CareerDayContext context, IMapper mapper,
        UserManager<User> userManager, ILogger<CareersController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly IMapper _mapper = mapper;
        private readonly UserManager<User> _userManager = userManager;
        private readonly ILogger<CareersController> _logger = logger;

        [HttpGet]
        public async Task<ActionResult<List<Career>>> GetCareers()
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            return await _context.Careers
                .Where(c => c.LicenseId == currentLicenseId)
                .OrderBy(c => c.CourseId)
                .ToListAsync();
        }

        /**
         * Unused
         */
        [HttpGet("{id}", Name = "GetCareer")]
        public async Task<ActionResult<Career>> GetCareer(int id)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var userLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            return await _context.Careers.FirstOrDefaultAsync(c => c.Id == id && c.LicenseId == userLicenseId);
        }

        [HttpGet("CareerCategories")]
        public async Task<ActionResult<List<string>>> GetCareerCategories()
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            return await _context.Careers
                .Where(c => c.LicenseId == currentLicenseId)
                .Select(c => c.Category)
                .Distinct()
                .OrderBy(c => c)
                .ToListAsync();
        }

        [HttpPost]
        public async Task<ActionResult<Career>> CreateCareer(Career career)
        {
            try {
                var currentUser = await _userManager.GetUserAsync(User);

                career.LicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;
                career.License = null;

                _context.Careers.Add(career);

                var result = await _context.SaveChangesAsync() > 0;
                
                if (result) return CreatedAtRoute("GetCareer", new { id = career.Id }, career);

            } catch (DbUpdateException e) when (IsUniqueConstraintException(e)) {
                return Conflict(new { message = GetAndLogErrorMsg(e)});
            }

            return BadRequest(new ProblemDetails { Title = "Problem creating new Career" });
        }

        [HttpPut]
        public async Task<ActionResult<Career>> UpdateCareer([FromForm] UpdateCareerDto careerDto)
        {
            var career = await _context.Careers.FindAsync(careerDto.Id);
            if (career == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (career.LicenseId != currentUser.LicenseId) return Forbid();

            try {
                _mapper.Map(careerDto, career);

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return Ok(career);

            } catch (DbUpdateException e) when (IsUniqueConstraintException(e)) {
                return Conflict(new { message = GetAndLogErrorMsg(e)});
            }

            return BadRequest(new ProblemDetails { Title = "Problem updating career" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteCareer(int id)
        {
            var career = await _context.Careers.FindAsync(id);
            if (career == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (career.LicenseId != currentUser.LicenseId) return Forbid();

            _context.Careers.Remove(career);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting career" });
        }        

        private static bool IsUniqueConstraintException(DbUpdateException e)
        {
            return e.InnerException != null && e.InnerException.Message.Contains("23505");
        }

        private string GetAndLogErrorMsg(DbUpdateException e) {
            var msg = "A unqiue contraint exception has occurred";
            if (e.InnerException.Message.Contains("CourseId")) {
                msg = "A career with this Course Id already exists";
            } else if (e.InnerException.Message.Contains("Name")) {
                msg = "A career  with this Name already exists";
            }
            _logger.LogError(e, "An error occurred creating or updating a career");
            return msg;
        }
    }
}