using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using CareerDayApi.Extensions;
using CareerDayApi.RequestHelpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    public class EventsController(CareerDayContext context) : BaseApiController
    {
        private readonly CareerDayContext _context = context;

        [HttpGet]
        public async Task<ActionResult<PagedList<Event>>> GetEvents([FromQuery]CareerEventParams careerEventParams)
        {
            var query = _context.Events
                .Sort(careerEventParams.OrderBy)
                .Search(careerEventParams.SearchTerm)
                .Filter(careerEventParams.EventPhases, careerEventParams.SurveyCompletePercent, careerEventParams.IsDeleted)
                .AsQueryable()
                .Include(e => e.School).ThenInclude(s => s.Address)
                .Include(e => e.EventPhase);

            var events = await PagedList<Event>.ToPagedList(query, 
                careerEventParams.PageNumber, careerEventParams.PageSize);

            Response.AddPaginationHeader(events.MetaData);

            return events;
        }

        [HttpGet("{id}", Name = "GetEvent")]
        public async Task<ActionResult<Event>> GetEvent(int id)
        {
            var singleEvent = await getEventDetails()
                .FirstOrDefaultAsync(e => e.Id == id);

            if (singleEvent == null) return NotFound();
            
            var cookieOptions = new CookieOptions{IsEssential = true, Expires = DateTime.Now.AddDays(30)};
            Response.Cookies.Append("eventId", singleEvent.Id.ToString(), cookieOptions);

            return singleEvent;
        }

        [HttpPost]
        public async Task<ActionResult<Event>> CreateEvent(EventDto eventDto)
        {
            EventPhase eventPhase = await _context.EventPhases.FindAsync(eventDto.EventPhaseId);
            School school = await _context.Schools.FindAsync(eventDto.SchoolId);

            List<Speaker> speakers = await _context.Speakers.Where(s => eventDto.SpeakerIds.Any(id => id == s.Id)).ToListAsync();

            if (eventPhase == null) {
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: Event Phase not found"});
            }
            if (school == null) {
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: School not found"});
            }
            if (speakers == null) {
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: Speakers not found"});
            }

            Event newEvent = new()
            {
                Name = eventDto.Name,
                Description = eventDto.Description,
                SurveyCompletePercent = eventDto.SurveyCompletePercent,
                EventPhase = eventPhase,
                Speakers = speakers,
                School = school,
                EventDate = eventDto.EventDate
            };
            _context.Events.Add(newEvent);
            
            var result = await _context.SaveChangesAsync() > 0;

            if (result) {
                Event createdEvent = await getEventDetails()
                    .FirstOrDefaultAsync(e => e.Id == newEvent.Id);

                return CreatedAtRoute("GetEvent", new { id = createdEvent.Id }, createdEvent);
            }
            return BadRequest(new ProblemDetails{Title = "Problem creating new event"});
        }

        [HttpPut]
        public async void DeleteEvent(int eventId)
        {
            var singleEvent = await _context.Events.FirstOrDefaultAsync(e => e.Id == eventId);
            singleEvent.IsDeleted = true;

            _context.SaveChanges();
        }

        [HttpGet("eventPhases")]
        public async Task<ActionResult<string[]>> GetEventPhases()
        {
            var eventPhases = await _context.EventPhases.Select(e => e.PhaseName).Distinct().ToListAsync();

            return Ok(eventPhases);
        }

        private IQueryable<Event> getEventDetails() {
            return _context.Events
                    .Include(p => p.EventPhase)
                    .Include(s => s.School).ThenInclude(a => a.Address)
                    .Include(s => s.Speakers).ThenInclude(c => c.Careers)
                    .Include(s => s.Speakers).ThenInclude(a => a.Address);
        }
    }
}