using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using CareerDayApi.Extensions;
using CareerDayApi.RequestHelpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    public class EventsController(CareerDayContext context,
        ILogger<EventsController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly ILogger<EventsController> _logger = logger;

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
        public async Task<ActionResult<Event>> CreateEvent([FromForm] EventDto eventDto)
        {
            EventPhase eventPhase = await _context.EventPhases.FindAsync(eventDto.EventPhase.Id);
            School school = await _context.Schools.FindAsync(eventDto.School.Id);

            if (eventPhase == null) {
                _logger.LogError("Error creating new Event: Event Phase not found: {eventPhase}", eventDto.EventPhase);
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: Event Phase not found"});
            }
            if (school == null) {
                _logger.LogError("Error creating new Event: School not found: {school}", eventDto.School);
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: School not found"});
            }

            //TODO create mapper
            Event newEvent = new()
            {
                School = school,
                EventDate = eventDto.EventDate,
                Name = eventDto.Name,
                Description = eventDto.Description,
                SurveyCompletePercent = 0,
                EventPhase = eventPhase,
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

        [HttpPut("update")]
        public async Task<ActionResult<Event>> UpdateEvent([FromForm] UpdateEventDto updateEventDto)
        {
            var updateEvent = await _context.Events.FindAsync(updateEventDto.Id);
            if (updateEvent == null) return NotFound();

            EventPhase eventPhase = await _context.EventPhases.FindAsync(updateEventDto.EventPhase.Id);
            School school = await _context.Schools.FindAsync(updateEventDto.School.Id);
            List<Speaker> speakers = await _context.Speakers.Where(s => updateEventDto.SpeakerIds.Any(id => id == s.Id)).ToListAsync();
            List<Career> careers = await _context.Careers.Where(c => updateEventDto.CareerIds.Any(id => id == c.Id)).ToListAsync();

            if (eventPhase == null) {
                _logger.LogError("Error updating new Event: Event Phase not found: {eventPhase}, {eventName}, {eventId}",
                    updateEventDto.EventPhase, updateEventDto.Name, updateEventDto.Id);
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: Event Phase not found"});
            }
            if (school == null) {
                _logger.LogError("Error updating new Event: School not found: {school}, {eventName}, {eventId}",
                    updateEventDto.School, updateEventDto.Name, updateEventDto.Id);
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: School not found"});
            }
            if (speakers == null) {
                _logger.LogError("Error updating new Event: Speakers not found: {speakerIds}, {eventName}, {eventId}",
                    updateEventDto.SpeakerIds, updateEventDto.Name, updateEventDto.Id);
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: Speakers not found"});
            }
            if (careers == null) {
                _logger.LogError("Error updating new Event: Careers not found: {careerIds}, {eventName}, {eventId}",
                    updateEventDto.CareerIds, updateEventDto.Name, updateEventDto.Id);
                return BadRequest(new ProblemDetails{Title = "Problem creating new event: Careers not found"});
            }

            updateEvent.School = school;
            updateEvent.EventDate = updateEventDto.EventDate;
            updateEvent.Name = updateEventDto.Name;
            updateEvent.Description = updateEventDto.Description;
            updateEvent.SurveyCompletePercent = updateEventDto.SurveyCompletePercent;
            updateEvent.EventPhase = eventPhase;
            updateEvent.Speakers = speakers;
            updateEvent.Careers = careers;

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(updateEvent);

            return BadRequest(new ProblemDetails { Title = "Problem updating Event" });
        }

        [HttpPut("delete")]
        public async void DeleteEvent(int eventId)
        {
            var singleEvent = await _context.Events.FirstOrDefaultAsync(e => e.Id == eventId);
            singleEvent.IsDeleted = true;

            _context.SaveChanges();
        }

        [HttpGet("phases")]
        public async Task<ActionResult<EventPhase[]>> GetEventPhases()
        {
            var eventPhases = await _context.EventPhases.Select(e => e).Distinct().ToListAsync();

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