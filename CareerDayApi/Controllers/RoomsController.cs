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
    public class RoomsController(CareerDayContext context,
        ILogger<RoomsController> logger, IMapper mapper) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly ILogger<RoomsController> _logger = logger;
        private readonly IMapper _mapper = mapper;

        [HttpGet]
        public async Task<ActionResult<List<Classroom>>> GetClassrooms()
        {
            return await _context.Classrooms
                .OrderBy(c => c.Building).OrderBy(c => c.RoomNumber)
                .ToListAsync();
        }

        [HttpGet("BySchool")]
        public async Task<ActionResult<List<Classroom>>> GetClassroomsBySchool([FromQuery]ClassroomParams classroomParams)
        {
            var query = _context.Classrooms
                .Where(c => c.School.Id == classroomParams.SchoolId)
                .Search(classroomParams.SearchTerm)
                .Include(c => c.School);
            
            var classrooms = await PagedList<Classroom>.ToPagedList(query,
                classroomParams.PageNumber, classroomParams.PageSize);

            Response.AddPaginationHeader(classrooms.MetaData);

            return classrooms;
        }

        [HttpGet("{id}", Name = "GetClassroomById")]
        public async Task<ActionResult<Classroom>> GetClassroomById(int id)
        {
            return await _context.Classrooms.FindAsync(id);
        }

        [HttpPost]
        public async Task<ActionResult<Classroom>> CreateClassroom(Classroom classroom)
        {
            var school = await _context.Schools.FindAsync(classroom.School.Id);
            classroom.School = school;

            _context.Classrooms.Add(classroom);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return CreatedAtRoute("GetClassroomById", new { Id = classroom.Id }, classroom);

            return BadRequest(new ProblemDetails { Title = "Problem creating classroom" });
        }

        [HttpPut]
        public async Task<ActionResult<Classroom>> UpdateClassroom([FromForm] UpdateClassroomDto classroomDto)
        {
            var classroom = await _context.Classrooms.FindAsync(classroomDto.Id);
            if (classroom == null) return NotFound();

            _mapper.Map(classroomDto, classroom);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(classroom);
            
            return BadRequest(new ProblemDetails { Title = "Problem Updating Classroom" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteClassroom(int id)
        {
            var classroom = await _context.Classrooms.FindAsync(id);

            if (classroom == null) return NotFound();

            _context.Classrooms.Remove(classroom);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting classroom" });
        }
    }
}