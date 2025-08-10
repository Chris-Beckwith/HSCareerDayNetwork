using AutoMapper;
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using CareerDayApi.Extensions;
using CareerDayApi.RequestHelpers;
using CareerDayApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QRCoder;

namespace CareerDayApi.Controllers
{
    public class EventsController(CareerDayContext context, IConfiguration config,
        IMapper mapper, ILogger<EventsController> logger, ImageService imageService, 
        DbContextOptions<CareerDayContext> dbContextOptions) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly IConfiguration _config = config;
        private readonly IMapper _mapper = mapper;
        private readonly ImageService _imageService = imageService;
        private readonly ILogger<EventsController> _logger = logger;
        private readonly DbContextOptions _dbContextOptions = dbContextOptions;

        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<PagedList<Event>>> GetEvents([FromQuery]CareerEventParams careerEventParams)
        {
            var query = _context.Events
                .Sort(careerEventParams.OrderBy)
                .Search(careerEventParams.SearchTerm)
                .Filter(careerEventParams.EventPhases, careerEventParams.SurveyCompletePercent, careerEventParams.IsDeleted)
                .AsQueryable()
                .getEventDetails();

            var events = await PagedList<Event>.ToPagedList(query,
                careerEventParams.PageNumber, careerEventParams.PageSize);

            Response.AddPaginationHeader(events.MetaData);

            foreach (var e in events)
            {
                using var newContext = new CareerDayContext(_dbContextOptions);
                e.SurveyCompletePercent = await CalculateSurveyProgressAsync(e.Id, newContext);
            }

            return events;
        }

        [HttpGet("{id}", Name = "GetEvent")]
        [Authorize(Roles = "Admin, SchoolUser")]
        public async Task<ActionResult<Event>> GetEvent(int id)
        {
            var singleEvent = await _context.Events.getEventDetails()
                .FirstOrDefaultAsync(e => e.Id == id);

            if (singleEvent == null) return NotFound();
            
            using var newContext = new CareerDayContext(_dbContextOptions);
            singleEvent.SurveyCompletePercent = await CalculateSurveyProgressAsync(singleEvent.Id, newContext);
            
            var cookieOptions = new CookieOptions{IsEssential = true, Expires = DateTime.Now.AddDays(30)};
            Response.Cookies.Append("eventId", singleEvent.Id.ToString(), cookieOptions);

            return singleEvent;
        }

        [HttpGet("GetEventByGuid/{guid}")]
        [AllowAnonymous]
        public async Task<ActionResult<Event>> GetEventByGuid(string guid)
        {
            var singleEvent = await _context.Events.getEventDetails()
                .FirstOrDefaultAsync(e => e.GUID == guid);

            if (singleEvent == null) return NotFound();

            using var newContext = new CareerDayContext(_dbContextOptions);
            singleEvent.SurveyCompletePercent = await CalculateSurveyProgressAsync(singleEvent.Id, newContext);

            return singleEvent;
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
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
                Name = string.IsNullOrEmpty(eventDto.Name) ? school.Name : eventDto.Name,
                Description = eventDto.Description,
                SurveyCompletePercent = 0,
                EventPhase = eventPhase,
            };
            _context.Events.Add(newEvent);
            
            var result = await _context.SaveChangesAsync() > 0;

            if (result) {
                Event createdEvent = await _context.Events.getEventDetails()
                    .FirstOrDefaultAsync(e => e.Id == newEvent.Id);

                return CreatedAtRoute("GetEvent", new { id = createdEvent.Id }, createdEvent);
            }
            return BadRequest(new ProblemDetails{Title = "Problem creating new event"});
        }

        [HttpPut("updatePhase")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<Event>> UpdateEventPhase([FromForm] UpdateEventPhaseDto updateEventPhaseDto)
        {
            var updateEvent = await _context.Events.FindAsync(updateEventPhaseDto.EventId);
            if (updateEvent == null) return NotFound();
            
            EventPhase eventPhase = await _context.EventPhases.FindAsync(updateEventPhaseDto.PhaseId);

            if (eventPhase == null) {
                _logger.LogError("Error updating Event: Event Phase not found: {eventPhaseId}, {eventName}",
                    updateEventPhaseDto.PhaseId, updateEvent.Name);
                return BadRequest(new ProblemDetails{Title = "Problem updating event: Event Phase not found"});
            }

            if (eventPhase.PhaseName == "Survey In Progress" && updateEvent.GUID == null)
            {
                updateEvent.GUID = Guid.NewGuid().ToString();
                if (updateEvent.QRCodeUrl == null && updateEvent.GUID != null) {
                    using QRCodeGenerator qrGenerator = new();
                    QRCodeData qrCodeData = qrGenerator.CreateQrCode(
                        _config["HostName"] + "survey/" + updateEvent.GUID, QRCodeGenerator.ECCLevel.Q);
                    using PngByteQRCode qrCode = new(qrCodeData);
                    var qrByteArray = qrCode.GetGraphic(20);
                    var stream = new MemoryStream(qrByteArray);
                    var qrImage = new FormFile(stream, 0, qrByteArray.Length,
                        "qrCodeForEvent", "eventQRCode-" + updateEvent.GUID + ".png")
                    {
                        Headers = new HeaderDictionary(),
                        ContentType = "image/png"
                    };

                    var imageResult = await _imageService.AddImageAsync(qrImage);

                    if (imageResult.Error != null) {
                        return BadRequest(new ProblemDetails {
                            Title = "Probelm creating QR code for event: " + updateEvent.Name
                        });
                    }

                    updateEvent.QRCodeUrl = imageResult.SecureUrl.ToString();
                    updateEvent.PublicId = imageResult.PublicId;
                }
            }

            updateEvent.EventPhase = eventPhase;
            
            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(updateEvent);

            return BadRequest(new ProblemDetails { Title = "Problem updating Event" });
        }

        [HttpPut("update")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<Event>> UpdateEvent([FromForm] UpdateEventDto updateEventDto)
        {
            var updateEvent = await _context.Events
                                            .Include(e => e.Speakers)
                                            .Include(e => e.Careers)
                                            .FirstOrDefaultAsync(e => e.Id == updateEventDto.Id);
            if (updateEvent == null) return NotFound();

            School school = await _context.Schools.FindAsync(updateEventDto.School.Id);
            List<Speaker> newSpeakers = [];
            if (updateEventDto.Speakers != null && updateEventDto.Speakers.Count != 0) {
                newSpeakers = await _context.Speakers
                                            .Where(s => updateEventDto.Speakers
                                                            .Select(dto => dto.Id)
                                                            .Contains(s.Id))
                                            .ToListAsync();
            }
            List<Career> newCareers = [];
            if (updateEventDto.Careers != null && updateEventDto.Careers.Count != 0) {
                newCareers = await _context.Careers
                                            .Where(c => updateEventDto.Careers
                                                            .Select(dto => dto.Id)
                                                            .Contains(c.Id))
                                            .ToListAsync();
            }

            if (school == null) {
                _logger.LogError("Error updating new Event: School not found: {school}, {eventName}, {eventId}",
                    updateEventDto.School, updateEventDto.Name, updateEventDto.Id);
                return BadRequest(new ProblemDetails { Title = "Problem updating event: School not found"});
            }
            if (newSpeakers == null) {
                _logger.LogError("Error updating new Event: Speakers not found: {speakers}, {eventName}, {eventId}",
                    updateEventDto.Speakers, updateEventDto.Name, updateEventDto.Id);
                return BadRequest(new ProblemDetails { Title = "Problem updating event: Speakers not found"});
            }
            if (newCareers == null) {
                _logger.LogError("Error updating new Event: Careers not found: {careers}, {eventName}, {eventId}",
                    updateEventDto.Careers, updateEventDto.Name, updateEventDto.Id);
                return BadRequest(new ProblemDetails { Title = "Problem updating event: Careers not found" });
            }

            // Update Speakers
            var existingSpeakerIds = updateEvent.Speakers.Select(s => s.Id).ToHashSet();
            var newSpeakerIds = newSpeakers.Select(s => s.Id).ToHashSet();
            _logger.LogWarning("Existing Speakers: {existingSpeakers}", updateEvent.Speakers.ToList());
            _logger.LogWarning("New Speakers: {newSpeakers}", newSpeakers.ToList());

            var speakersToRemove = updateEvent.Speakers.Where(s => !newSpeakerIds.Contains(s.Id)).ToList();
            foreach (var speaker in speakersToRemove)
            {
                updateEvent.Speakers.Remove(speaker);
            }

            var speakersToAdd = newSpeakers.Where(s => !existingSpeakerIds.Contains(s.Id)).ToList();
            _logger.LogWarning("Speakers to add: {speakersToAdd}", speakersToAdd);
            foreach (var speaker in speakersToAdd)
            {
                updateEvent.Speakers.Add(speaker);
            }

            // Update Careers
            var existingCareerIds = updateEvent.Careers.Select(c => c.Id).ToHashSet();
            var newCareerIds = newCareers.Select(c => c.Id).ToHashSet();

            var careersToRemove = updateEvent.Careers.Where(c => !newCareerIds.Contains(c.Id)).ToList();
            foreach (var career in careersToRemove)
            {
                updateEvent.Careers.Remove(career);
            }

            var careersToAdd = newCareers.Where(c => !existingCareerIds.Contains(c.Id)).ToList();
            foreach (var career in careersToAdd)
            {
                updateEvent.Careers.Add(career);
            }

            updateEvent.School = school;
            updateEvent.EventDate = updateEventDto.EventDate;
            updateEvent.Name = updateEventDto.Name;
            updateEvent.Description = updateEventDto.Description;
            updateEvent.SurveyCompletePercent = updateEventDto.SurveyCompletePercent;

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(updateEvent);

            return BadRequest(new ProblemDetails { Title = "Problem updating Event" });
        }

        [HttpPut("{eventId}/{isDeleted}")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<Event>> DeleteEvent(int eventId, bool isDeleted)
        {
            var singleEvent = await _context.Events.FirstOrDefaultAsync(e => e.Id == eventId);

            if (singleEvent != null) {
                singleEvent.IsDeleted = isDeleted;

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return Ok(singleEvent);   
            }

            _logger.LogError("Error deleting Event: {eventId}", singleEvent.Id);
            return BadRequest(new ProblemDetails { Title = "Problem deleting Event" });
        }

        private static async Task<int> CalculateSurveyProgressAsync(int id, CareerDayContext context)
        {
            var totalStudents = await context.Students.Where(s => s.EventId == id).ToListAsync();
            var totalSubmissions = await context.Surveys.Where(s => s.Student.EventId == id).ToListAsync();

            if (totalSubmissions.Count == 0 || totalStudents.Count == 0) return 0;

            return (int)Math.Floor(
                (double)totalSubmissions.Count / totalStudents.Count * 100
            );
        }

        [HttpGet("phases")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<EventPhase[]>> GetEventPhases()
        {
            var eventPhases = await _context.EventPhases
                .Select(e => e)
                .Distinct()
                .OrderBy(e => e.Id)
                .ToListAsync();

            return Ok(eventPhases);
        }

        [HttpPost("scheduleParams")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<ScheduleParams>> SaveScheduleParams([FromBody] ScheduleParams scheduleParams)
        {
            var existing = await _context.ScheduleParams.FirstOrDefaultAsync(sp => sp.EventId == scheduleParams.EventId);
            
            if (existing != null) {
                existing.MaxClassSize = scheduleParams.MaxClassSize;
                existing.MinClassSize = scheduleParams.MinClassSize;
                existing.PeriodCount = scheduleParams.PeriodCount;
                existing.RequiredPeriodForCareerList = scheduleParams.RequiredPeriodForCareerList;
                existing.SameSpeakersForCareerList = scheduleParams.SameSpeakersForCareerList;

                _context.ScheduleParams.Update(existing);
            } else {
                _context.ScheduleParams.Add(scheduleParams);
            }

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(scheduleParams);

            return BadRequest(new ProblemDetails { Title = "Problem saving schedule paramters" });
        }

        [HttpGet("scheduleParams/{id}", Name = "getScheduleParams")]
        public async Task<ActionResult<GenerateScheduleParamsDto>> GetScheduleParams(int id)
        {
            var scheduleParams = await _context.ScheduleParams.FirstOrDefaultAsync(sp => sp.EventId == id);

            if (scheduleParams == null) return NotFound();

            var dto = new GenerateScheduleParamsDto();

            _mapper.Map(scheduleParams, dto);

            return dto;
        }
    }
}