using CareerDayApi.Data;
using CareerDayApi.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    public class SpeakersController(CareerDayContext context) : BaseApiController
    {
        private readonly CareerDayContext _context = context;

        [HttpGet]
        public async Task<ActionResult<List<Speaker>>> GetSpeakers()
        {
            return await _context.Speakers
                .Include(a => a.Address)
                .Include(c => c.Careers).ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Speaker>> GetSpeaker(int id)
        {
            return await _context.Speakers
                .Include(a => a.Address)
                .Include(c => c.Careers)
                .FirstOrDefaultAsync(s => s.Id == id);
        }
    }
}