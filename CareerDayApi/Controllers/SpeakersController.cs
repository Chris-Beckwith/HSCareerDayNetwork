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

namespace CareerDayApi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class SpeakersController(CareerDayContext context, IMapper mapper, ImageService imageService,
        ILogger<SpeakersController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly IMapper _mapper = mapper;
        private readonly ImageService _imageService = imageService;
        private readonly ILogger _logger = logger;

        [HttpGet]
        public async Task<ActionResult<PagedList<Speaker>>> GetSpeakers([FromQuery]SpeakerParams speakerParams)
        {
            var query = _context.Speakers
                .Search(speakerParams.SearchTerm)
                .Include(s => s.Address)
                .Include(s => s.Careers)
                .Include(s => s.SchoolLastSpokeAt);
            
            var speakers = await PagedList<Speaker>.ToPagedList(query,
                speakerParams.PageNumber, speakerParams.PageSize);

            Response.AddPaginationHeader(speakers.MetaData);

            return speakers;
        }

        [HttpGet("{id}", Name = "GetSpeaker")]
        public async Task<ActionResult<Speaker>> GetSpeaker(int id)
        {
            var speaker = await _context.Speakers
                .Include(s => s.Address)
                .Include(s => s.Careers)
                .Include(s => s.SchoolLastSpokeAt)
                .FirstOrDefaultAsync(s => s.Id == id);

            if (speaker == null)
            {
                _logger.LogInformation("Speaker Not Found ID: {id}", id);
                return NotFound();
            }

            return speaker;
        }

        [HttpPost]
        public async Task<ActionResult<Speaker>> CreateSpeaker([FromForm] CreateSpeakerDto speakerDto)
        {
            List<Career> careers = await _context.Careers.Where(c => speakerDto.CareerIds.Any(id => id == c.Id)).ToListAsync();

            if (careers == null)
            {
                return BadRequest(new ProblemDetails { Title = "Problem creating new speaker: Careers not found" });
            }

            var speaker = _mapper.Map<Speaker>(speakerDto);
            speaker.Careers = careers;

            if (speakerDto.SchoolLastSpokeAt != null) {
                School school = await _context.Schools.Where(s => s.Id == speakerDto.SchoolLastSpokeAt.Id).FirstOrDefaultAsync();

                if (school == null)
                {
                    return BadRequest(new ProblemDetails { Title = "Problem creating new speaker: School not found "});
                }
                speaker.SchoolLastSpokeAt = school;
            }

            if (speakerDto.File != null)
            {
                var imageResult = await _imageService.AddImageAsync(speakerDto.File);

                if (imageResult.Error != null) return BadRequest(new ProblemDetails { Title = imageResult.Error.Message });

                speaker.PortraitUrl = imageResult.SecureUrl.ToString();
                speaker.PublicId = imageResult.PublicId;
            }

            _context.Speakers.Add(speaker);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return CreatedAtRoute("GetSpeaker", new { Id = speaker.Id }, speaker);

            return BadRequest(new ProblemDetails { Title = "Problem creating new speaker" });
        }

        [HttpPut]
        public async Task<ActionResult<Speaker>> UpdateSpeaker([FromForm] UpdateSpeakerDto speakerDto)
        {
            var speaker = await _context.Speakers
                .Include(s => s.Careers)
                .Include(s => s.Address)
                .FirstOrDefaultAsync(s => s.Id == speakerDto.Id);

            if (speaker == null) return NotFound();

            if (speakerDto.SchoolLastSpokeAt != null) {
                School school = await _context.Schools
                    .AsNoTracking()
                    .FirstOrDefaultAsync(s => s.Id == speakerDto.SchoolLastSpokeAt.Id);

                if (school == null)
                {
                    return BadRequest(new ProblemDetails { Title = "Problem updating speaker: School not found" });
                }
                speaker.SchoolLastSpokeAt = school;
            }

            List<Career> careers = await _context.Careers.Where(c => speakerDto.CareerIds.Any(id => id == c.Id)).ToListAsync();

            if (careers == null)
            {
                return BadRequest(new ProblemDetails { Title = "Problem updating speaker: Careers not found" });
            }

            var careersToRemove = speaker.Careers.Except(careers).ToList();
            foreach (var career in careersToRemove)
            {
                speaker.Careers.Remove(career);
            }

            var careersToAdd = careers.Except(speaker.Careers).ToList();
            foreach (var career in careersToAdd)
            {
                speaker.Careers.Add(career);
            }

            _mapper.Map(speakerDto, speaker);

            if (speakerDto.File != null)
            {
                var imageResult = await _imageService.AddImageAsync(speakerDto.File);

                if (imageResult.Error != null) return BadRequest(new ProblemDetails { Title = imageResult.Error.Message });

                if (!string.IsNullOrEmpty(speaker.PublicId))
                {
                    var imageDeleteResult = await _imageService.DeleteImageAsync(speaker.PublicId);

                    if (imageDeleteResult.Error != null)
                        _logger.LogError("Problem deleting image from Cloudinary: {error}", imageDeleteResult.Error.Message);
                }

                speaker.PortraitUrl = imageResult.SecureUrl.ToString();
                speaker.PublicId = imageResult.PublicId;
            }

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(speaker);

            return BadRequest(new ProblemDetails { Title = "Problem updating speaker" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteSpeaker(int id)
        {
            var speaker = await _context.Speakers
                .Include(s => s.Careers)
                .Include(s => s.Address)
                .Include(s => s.SchoolLastSpokeAt)
                .FirstOrDefaultAsync(s => s.Id  == id);

            if (speaker == null) return NotFound();

            if (!string.IsNullOrEmpty(speaker.PublicId))
            {
                var imageDeleteResult = await _imageService.DeleteImageAsync(speaker.PublicId);

                if (imageDeleteResult.Error != null)
                    _logger.LogError("Problem deleting image from Cloudinary: {error}", imageDeleteResult.Error.Message);
            }

            _context.Speakers.Remove(speaker);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting speaker" });
        }
    }
}