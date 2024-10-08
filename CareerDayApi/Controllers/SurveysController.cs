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
                .Include(s => s.AlternateCareers)
                .Include(s => s.Student)
                .ToListAsync();
        }

        [HttpDelete("{eventId}")]
        public async Task<ActionResult> DeleteSurveysByEvent(int eventId)
        {
            var surveys = await _context.Surveys
                .Where(s => s.Student.EventId == eventId).ToListAsync();

            var students = await _context.Students
                .Where(s => s.EventId == eventId && s.SurveyComplete == true).ToListAsync();

            if (surveys == null) return NotFound();

            if (surveys.Count == 0) return Ok();

            _context.Surveys.RemoveRange(surveys);

            if (students != null && students.Count > 0) {
                foreach(Student s in students)
                {
                    s.SurveyComplete = false;
                }
            }

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting surveys for event" });
        }
    }
}