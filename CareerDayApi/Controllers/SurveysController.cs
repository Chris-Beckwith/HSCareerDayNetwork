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

        [HttpDelete("{eventId}")]
        public async Task<ActionResult> DeleteSurveysByEvent(int eventId)
        {
            var surveys = await _context.Surveys
                .Where(s => s.Student.EventId == eventId).ToListAsync();

            if (surveys == null) return NotFound();

            if (surveys.Count == 0) return Ok();

            _context.Surveys.RemoveRange(surveys);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting surveys for event" });
        }

        [HttpGet("TestData/{eventId}")]
        public async Task<ActionResult> CreateTestSurveyData(int eventId)
        {
            var careerEvent = await _context.Events.Include(c => c.Careers)
                .FirstOrDefaultAsync(e => e.Id == eventId);
            var students = await _context.Students.Where(s => s.EventId == eventId).ToListAsync();
            var surveys = new List<Survey>();

            foreach(Student s in students)
            {
                if (!s.SurveyComplete) {
                    var fiveCareers = careerEvent.Careers.OrderBy(x => Guid.NewGuid()).Take(5).ToList();
                    var pCareers = fiveCareers.Take(3).ToList();
                    var sCareers = fiveCareers.Skip(3).Take(2).ToList();
                    var survey = new Survey
                    {
                        Student = s,
                        StudentId = s.Id,
                        PrimaryCareers = pCareers,
                        SecondaryCareers = sCareers
                    };
                    surveys.Add(survey);
                }
                s.SurveyComplete = true;
            }

            _context.Surveys.AddRange(surveys);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(result);

            return BadRequest(new ProblemDetails { Title = "Problem creating test surveys "});
        }
    }
}