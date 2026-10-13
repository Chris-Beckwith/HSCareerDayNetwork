using AutoMapper;
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    [Authorize(Roles = "Admin, FullLicenseUser")]
    public class CareerSetsController(CareerDayContext context, IMapper mapper,
            UserManager<User> userManager, ILogger<CareerSetsController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly IMapper _mapper = mapper;
        private readonly UserManager<User> _userManager = userManager;
        private readonly ILogger<CareerSetsController> _logger = logger;

        [HttpGet]
        public async Task<ActionResult<List<CareerSet>>> GetCareerSets()
        {
            var currentUser = await _userManager.GetUserAsync(User);

            if (User.IsInRole("Admin"))
            {
                return await _context.CareerSets
                    .Where(cs => cs.LicenseId == null)
                    .Include(cs => cs.Careers).ToListAsync();
            }
            else
            {
                return await _context.CareerSets
                    .Where(cs => cs.LicenseId == currentUser.LicenseId)
                    .Include(cs => cs.Careers).ToListAsync();
            }
        }

        /**
         * Unused
         */
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
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId; 

            careerSet.LicenseId = currentLicenseId;
            careerSet.License = null;

            var careerIds = careerSet.Careers.Select(cs => cs.Id).ToList();
            List<Career> careers = await _context.Careers
                .Where(c => careerIds.Any(id => id == c.Id) && c.LicenseId == currentLicenseId)
                .ToListAsync();

            careerSet.Careers = careers;
            _context.CareerSets.Add(careerSet);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return CreatedAtRoute("GetCareerSet", new { Id = careerSet.Id }, careerSet);

            return BadRequest(new ProblemDetails { Title = "Problem creating new Career Set" });
        }

        [HttpPut]
        public async Task<ActionResult<CareerSet>> UpdateCareerSet([FromForm] UpdateCareerSetDto careerSetDto)
        {
            var careerSet = await _context.CareerSets
                .Include(cs => cs.Careers)
                .FirstOrDefaultAsync(cs => cs.Id == careerSetDto.Id);
            if (careerSet == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (careerSet.LicenseId != currentUser.LicenseId) return Forbid();

            // Update Careers
            List<Career> careers = await _context.Careers
                .Where(c => careerSetDto.CareerIds.Any(id => id == c.Id) && c.LicenseId == currentUser.LicenseId)
                .ToListAsync();

            if (careers.Count != careerSetDto.CareerIds.Count)
                return BadRequest(new ProblemDetails { Title = "Problem updating career set: Careers not found" });

            var careersToRemove = careerSet.Careers.Except(careers).ToList();
            foreach (var career in careersToRemove)
            {
                careerSet.Careers.Remove(career);
            }

            var careersToAdd = careers.Except(careerSet.Careers).ToList();
            foreach (var career in careersToAdd)
            {
                careerSet.Careers.Add(career);
            }

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

            var currentUser = await _userManager.GetUserAsync(User);
            if (careerSet.LicenseId != currentUser.LicenseId) return Forbid();

            _context.CareerSets.Remove(careerSet);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting career set "});
        }
    }
}