using AutoMapper;
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using CareerDayApi.Extensions;
using CareerDayApi.RequestHelpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class SchoolsController(CareerDayContext context, 
        IMapper mapper, ILogger<SchoolsController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly IMapper _mapper = mapper;
        private readonly ILogger<SchoolsController> _logger = logger;

        [HttpGet]
        public async Task<ActionResult<PagedList<School>>> GetSchools([FromQuery]SchoolParams schoolParams)
        {
            var query = _context.Schools.Include(a => a.Address);

            var schools = await PagedList<School>.ToPagedList(query,
                schoolParams.PageNumber, schoolParams.PageSize);

            Response.AddPaginationHeader(schools.MetaData);

            return schools;
        }

        [HttpGet("{id}", Name = "GetSchool")]
        public async Task<ActionResult<School>> GetSchool(int id)
        {
            return await _context.Schools.Include(a => a.Address).FirstOrDefaultAsync(s => s.Id == id);
        }

        [HttpPost]
        public async Task<ActionResult<School>> CreateSchool(School school)
        {
            _context.Schools.Add(school);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return CreatedAtRoute("GetSchool", new { Id = school.Id }, school);

            return BadRequest(new ProblemDetails { Title = "Problem creating new school" });
        }

        [HttpPut]
        public async Task<ActionResult<Speaker>> UpdateSchool([FromForm] UpdateSchoolDto schoolDto)
        {
            var school = await _context.Schools.FindAsync(schoolDto.Id);

            if (school == null) return NotFound();

            _mapper.Map(schoolDto, school);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(school);

            return BadRequest(new ProblemDetails { Title = "Problem updating school" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteSchool(int id)
        {
            var school = await _context.Schools.FindAsync(id);

            if (school == null) return NotFound();

            _context.Schools.Remove(school);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting school" });
        }
    }
}