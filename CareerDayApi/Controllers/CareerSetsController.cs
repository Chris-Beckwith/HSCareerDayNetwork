using AutoMapper;
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    public class CareerSetsController(CareerDayContext context, IMapper mapper,
            ILogger<CareerSetsController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly IMapper _mapper = mapper;
        private readonly ILogger<CareerSetsController> _logger = logger;

        [HttpGet]
        public async Task<ActionResult<List<CareerSet>>> GetCareerSets()
        {
            return await _context.CareerSets.Include(cs => cs.Careers).ToListAsync();
        }

        [HttpGet("{id}", Name = "GetCareerSet")]
        public async Task<ActionResult<CareerSet>> GetCareerSet(int id)
        {
            return await _context.CareerSets
                .Include(cs => cs.Careers)
                .FirstOrDefaultAsync(cs => cs.Id == id);
        }

        [HttpPost]
        public async Task<ActionResult<CareerSet>> CreateCareerSet(CareerSet careerSet)
        {
            var careerIds = careerSet.Careers.Select(cs => cs.Id).ToList();
            List<Career> careers = await _context.Careers.Where(c => careerIds.Any(id => id == c.Id)).ToListAsync();

            careerSet.Careers = careers;
            _context.CareerSets.Add(careerSet);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return CreatedAtRoute("GetCareerSet", new { Id = careerSet.Id }, careerSet);

            return BadRequest(new ProblemDetails { Title = "Problem creating new Career Set" });
        }

        [HttpPut]
        public async Task<ActionResult<CareerSet>> UpdateCareerSet([FromForm] UpdateCareerSetDto careerSetDto)
        {
            var careerSet = await _context.CareerSets.FindAsync(careerSetDto.Id);
            if (careerSet == null) return NotFound();

            _mapper.Map(careerSetDto, careerSet);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(careerSet);

            return BadRequest(new ProblemDetails { Title = "Problem updating career set" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteCareerSet(int id)
        {
            var careerSet = await _context.CareerSets.FindAsync(id);

            if (careerSet == null) return NotFound();

            _context.CareerSets.Remove(careerSet);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting career set "});
        }
    }
}