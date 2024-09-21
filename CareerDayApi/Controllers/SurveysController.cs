using CareerDayApi.Data;
using CareerDayApi.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    public class SurveysController(CareerDayContext context, 
        ILogger<SurveysController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly ILogger<SurveysController> _logger = logger;
        
        [HttpGet("{eventId}")]
        public async Task<ActionResult<List<Survey>>> GetSurveysByEvent(int eventId)
        {
            return await _context.Surveys
                .Where(s => s.Student.EventId == eventId)
                .Include(s => s.PrimaryCareers)
                .Include(s => s.SecondaryCareers)
                .Include(s => s.Student)
                .ToListAsync();
        }
    }
}