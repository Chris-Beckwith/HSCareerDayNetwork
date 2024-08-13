using CareerDayApi.Data;
using CareerDayApi.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class CareersController(CareerDayContext context, ILogger<CareersController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly ILogger<CareersController> _logger = logger;

        [HttpGet]
        public async Task<ActionResult<List<Career>>> GetCareers()
        {
            return await _context.Careers.ToListAsync();
        }

        [HttpGet("CareerCategories")]
        public async Task<ActionResult<List<string>>> GetCareerCategories()
        {
            return await _context.Careers
                .Select(c => c.Category)
                .Distinct()
                .ToListAsync();
        }
    }
}