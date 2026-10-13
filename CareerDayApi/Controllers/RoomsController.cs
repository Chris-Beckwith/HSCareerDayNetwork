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
    [Authorize(Roles = "Admin, FullLicenseUser")]
    public class RoomsController(CareerDayContext context, UserManager<User> userManager,
        ILogger<RoomsController> logger, IMapper mapper) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly UserManager<User> _userManager = userManager;
        private readonly ILogger<RoomsController> _logger = logger;
        private readonly IMapper _mapper = mapper;

        [HttpGet("BySchool")]
        public async Task<ActionResult<List<Classroom>>> GetClassroomsBySchool([FromQuery]ClassroomParams classroomParams)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            var query = _context.Classrooms
                .Where(c => c.SchoolId == classroomParams.SchoolId && c.School.LicenseId == currentLicenseId)
                .OrderBy(c => c.Building).ThenBy(c => c.RoomNumber)
                .Search(classroomParams.SearchTerm)
                .Include(c => c.School);
            
            var classrooms = await PagedList<Classroom>.ToPagedList(query,
                classroomParams.PageNumber, classroomParams.PageSize);

            Response.AddPaginationHeader(classrooms.MetaData);

            return classrooms;
        }

        [HttpGet("LargeBySchool")]
        public async Task<ActionResult<List<Classroom>>> GetLargeRoomsBySchool([FromQuery]ClassroomParams classroomParams)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            var largeRooms = await _context.Classrooms
                .Where(c => c.SchoolId == classroomParams.SchoolId 
                    && c.Capacity > classroomParams.MaxClassSize
                    && c.School.LicenseId == currentLicenseId)
                .OrderBy(c => c.Building).ThenBy(c => c.RoomNumber)
                .ToListAsync();

            var metaData = new PaginationMetaData
            {
                TotalCount = largeRooms.Count,
                PageSize = classroomParams.PageSize,
                CurrentPage = classroomParams.PageNumber,
                TotalPages = (int)Math.Ceiling(largeRooms.Count / (double)classroomParams.PageSize)
            };

            Response.AddPaginationHeader(metaData);

            return largeRooms;
        }

        /**
         * Unused
         */
        [HttpGet("{id}", Name = "GetClassroomById")]
        public async Task<ActionResult<Classroom>> GetClassroomById(int id)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            return await _context.Classrooms
                .FirstOrDefaultAsync(c => c.Id == id && c.School.LicenseId == currentLicenseId);
        }

        [HttpPost]
        public async Task<ActionResult<Classroom>> CreateClassroom(CreateClassroomDto classroomDto)
        {
            var school = await _context.Schools.FindAsync(classroomDto.SchoolId);
            if (school == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (school.LicenseId != currentUser.LicenseId) return Forbid();

            var newClassroom = new Classroom
            {
                School = school,
                Building = classroomDto.Building,
                RoomNumber = classroomDto.RoomNumber,
                Capacity = classroomDto.Capacity,
                Overflow = classroomDto.Overflow
            };

            try
            {
                _context.Classrooms.Add(newClassroom);

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return CreatedAtRoute("GetClassroomById", new { Id = newClassroom.Id }, newClassroom);
            }
            catch (DbUpdateException e) when (IsUniqueConstraintException(e))
            {
                return Conflict(new { message = "Classroom must have unique room number for building" });
            }

            return BadRequest(new ProblemDetails { Title = "Problem creating classroom" });
        }

        [HttpPut]
        public async Task<ActionResult<Classroom>> UpdateClassroom([FromForm] UpdateClassroomDto classroomDto)
        {
            var currentUser = await _userManager.GetUserAsync(User);

            var classroom = await _context.Classrooms.
                FirstOrDefaultAsync(c => c.Id == classroomDto.Id && c.School.LicenseId == currentUser.LicenseId);
            
            if (classroom == null) return NotFound();

            try {
                _mapper.Map(classroomDto, classroom);

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return Ok(classroom);
            }
            catch (DbUpdateException e) when (IsUniqueConstraintException(e))
            {
                return Conflict(new { message = "Classroom must have unique room number for building" });
            }
            
            return BadRequest(new ProblemDetails { Title = "Problem Updating Classroom" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteClassroom(int id)
        {
            var currentUser = await _userManager.GetUserAsync(User);

            var classroom = await _context.Classrooms
                .FirstOrDefaultAsync(c => c.Id == id && c.School.LicenseId == currentUser.LicenseId);

            if (classroom == null) return NotFound();

            try {
                _context.Classrooms.Remove(classroom);

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return Ok();
            }
            catch (DbUpdateException e) when (IsUniqueConstraintException(e))
            {
                return Conflict(new { message = "Classroom cannot be deleted because it is assigned to a session in the scheduling tool" });
            }

            return BadRequest(new ProblemDetails { Title = "Problem deleting classroom" });
        }

        private static bool IsUniqueConstraintException(DbUpdateException e)
        {
            return e.InnerException != null 
                && (e.InnerException.Message.Contains("23503") || e.InnerException.Message.Contains("23505"));
        }
    }
}