using CareerDayApi.Data;
using CareerDayApi.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    public class SchoolsController(CareerDayContext context) : BaseApiController
    {
        private readonly CareerDayContext _context = context;

        [HttpGet]
        public async Task<ActionResult<List<School>>> GetSchools()
        {
            return await _context.Schools.Include(a => a.Address).ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<School>> GetSchool(int id)
        {
            return await _context.Schools.Include(a => a.Address).FirstOrDefaultAsync(s => s.Id == id);
        }
    }
}