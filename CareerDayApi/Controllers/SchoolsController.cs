using AutoMapper;
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using CareerDayApi.Extensions;
using CareerDayApi.RequestHelpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    [Authorize(Roles = "Admin, FullLicenseUser, SurveyLicenseUser")]
    public class SchoolsController(CareerDayContext context, UserManager<User> userManager,
        IMapper mapper, ILogger<SchoolsController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly UserManager<User> _userManager = userManager;
        private readonly IMapper _mapper = mapper;
        private readonly ILogger<SchoolsController> _logger = logger;

        [HttpGet]
        public async Task<ActionResult<PagedList<School>>> GetSchools([FromQuery] SchoolParams schoolParams)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            var query = _context.Schools
                .Where(s => s.LicenseId == currentLicenseId)
                .Search(schoolParams.SearchTerm)
                .Include(a => a.Address);

            var schools = await PagedList<School>.ToPagedList(query,
                schoolParams.PageNumber, schoolParams.PageSize);

            Response.AddPaginationHeader(schools.MetaData);

            return schools;
        }

        /**
         * Unused
         */
        [HttpGet("{id}", Name = "GetSchool")]
        public async Task<ActionResult<School>> GetSchool(int id)
        {
            var school = await _context.Schools.Include(a => a.Address).FirstOrDefaultAsync(s => s.Id == id);
            if (school == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (school.LicenseId != currentUser.LicenseId) return Forbid();

            return school;
        }

        [HttpPost]
        public async Task<ActionResult<School>> CreateSchool(School school)
        {
            try
            {
                var currentUser = await _userManager.GetUserAsync(User);
                school.LicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;
                school.License = null;

                _context.Schools.Add(school);

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return CreatedAtRoute("GetSchool", new { Id = school.Id }, school);
            }
            catch (DbUpdateException e) when (IsUniqueConstraintException(e))
            {
                return Conflict(new { message = GetAndLogErrorMsg(e) });
            }

            return BadRequest(new ProblemDetails { Title = "Problem creating new school" });
        }

        [HttpPut]
        public async Task<ActionResult<School>> UpdateSchool([FromForm] UpdateSchoolDto schoolDto)
        {
            try
            {
                var school = await _context.Schools.FindAsync(schoolDto.Id);

                if (school == null) return NotFound();

                var currentUser = await _userManager.GetUserAsync(User);
                if (school.LicenseId != currentUser.LicenseId) return Forbid();

                _mapper.Map(schoolDto, school);

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return Ok(school);
            }
            catch (DbUpdateException e) when (IsUniqueConstraintException(e))
            {
                return Conflict(new { message = GetAndLogErrorMsg(e) });
            }

            return BadRequest(new ProblemDetails { Title = "Problem updating school" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteSchool(int id)
        {
            var school = await _context.Schools.FindAsync(id);
            if (school == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (school.LicenseId != currentUser.LicenseId) return Forbid();

            try
            {
                _context.Schools.Remove(school);

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return Ok();
            }
            catch (DbUpdateException e) when (IsUniqueConstraintException(e))
            {
                return Conflict(new { message = GetAndLogErrorMsg(e) });
            }

            return BadRequest(new ProblemDetails { Title = "Problem deleting school" });
        }
        
        private static bool IsUniqueConstraintException(DbUpdateException e)
        {
            return e.InnerException != null 
                && (e.InnerException.Message.Contains("23503") || e.InnerException.Message.Contains("23505"));
        }

        private string GetAndLogErrorMsg(DbUpdateException e)
        {
            var msg = "A unqiue contraint exception has occurred";
            if (e.InnerException.Message.Contains("Students_Schools_SchoolId"))
            {
                msg = "The school has an event with students in it.  Please remove the students from event to delete the school";
            }
            else if (e.InnerException.Message.Contains("Schools_Name"))
            {
                msg = "Please choose a unique school name.";
            }
            _logger.LogError(e, "An error occurred deleting a school");
            return msg;
        }
    }
}