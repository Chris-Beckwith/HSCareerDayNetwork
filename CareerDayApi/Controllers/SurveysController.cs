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
    public class SurveysController(CareerDayContext context, ExcelService excelService,
        ILogger<SurveysController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly ExcelService _excelService = excelService;
        private readonly ILogger<SurveysController> _logger = logger;
        
        [HttpGet("{eventId}")]
        [Authorize(Roles = "Admin, SchoolUser")]
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
        [Authorize(Roles = "Admin")]
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

        [HttpGet("export")]
        [Authorize(Roles = "Admin, SchoolUser")]
        public async Task<ActionResult> ExportSurvey([FromQuery] SurveyParams surveyParams)
        {
            var surveyResults = await _context.Surveys
                .Where(s => s.Student.EventId == surveyParams.EventId)
                .Include(s => s.PrimaryCareers)
                .Include(s => s.AlternateCareers)
                .Include(s => s.Student)
                .ToListAsync();

            var careerEvent = await _context.Events.getEventDetails()
                .FirstOrDefaultAsync(e => e.Id == surveyParams.EventId);

            if (surveyResults.Count == 0)
                return NotFound("No surveys found for event: " + surveyParams.EventId);

            if (careerEvent == null)
                return NotFound("No event found for event Id: " + surveyParams.EventId);

            var headers = new List<string>();

            //By Students
            if (surveyParams.ViewOption) {
                headers.Add("Student Number");
                headers.Add("Student Name");
                headers.Add("Gender");
                headers.Add("Grade");
                headers.Add("Teacher");
                headers.Add("Room");
                headers.Add("Primary Choice 1");
                headers.Add("Primary Choice 2");
                headers.Add("Primary Choice 3");
                headers.Add("Alternate Choice 1");
                headers.Add("Alternate Choice 2");
            }
            //By Categories
            else {
                headers.Add("Course Id");
                headers.Add("Category");
                headers.Add("Count");
                
                //Include Alternate Counts
                if (surveyParams.IncludeAlternate) {
                    headers.Add("Alternate Count");
                }
            }

            var rows = new List<object[]>();

            //By Students
            if (surveyParams.ViewOption) {
                rows.AddRange(surveyResults.Select(survey => new object[]
                {
                    survey.Student.StudentNumber,
                    survey.Student.LastFirstName,
                    survey.Student.Gender,
                    survey.Student.Grade,
                    survey.Student.HomeroomTeacher,
                    survey.Student.HomeroomNumber,
                    survey.PrimaryCareers[0].Name,
                    survey.PrimaryCareers[1].Name,
                    survey.PrimaryCareers[2].Name,
                    survey.AlternateCareers[0].Name,
                    survey.AlternateCareers[1].Name
                }).ToList());
            }
            // By Categories
            else {
                var primaryCounts = careerEvent.Careers.Select(career => new CareerCountDto
                {
                    Name = career.Name,
                    Category = career.Category,
                    CourseId = career.CourseId,
                    Count = surveyResults
                        .SelectMany(s => s.PrimaryCareers)
                        .Count(selectedCareer => selectedCareer.Name == career.Name)
                }).ToList();
                
                var alternateCounts = careerEvent.Careers.Select(career => new CareerCountDto
                {
                    Name = career.Name,
                    Category = career.Category,
                    CourseId = career.CourseId,
                    Count = surveyResults
                        .SelectMany(s => s.AlternateCareers)
                        .Count(selectedCareer => selectedCareer.Name == career.Name)
                }).ToList();

                var sortedCounts = surveyParams.SortOption == true
                    ? primaryCounts.OrderByDescending(c => c.Count).ToList()
                    : primaryCounts.OrderBy(c => c.CourseId).ToList();
                
                string categoryName = "";

                foreach(var career in sortedCounts)
                {
                    if (categoryName != career.Category) {
                        categoryName = career.Category;
                        rows.Add([
                            categoryName
                        ]);
                    }

                    if (surveyParams.IncludeAlternate) {
                        var altCount = alternateCounts.Find(c => c.Name == career.Name).Count;
                        rows.Add([
                            career.CourseId,
                            career.Name,
                            career.Count,
                            altCount
                        ]);
                    } else {
                        rows.Add([
                            career.CourseId,
                            career.Name,
                            career.Count
                        ]);
                    }
                }
            }

            string fileName;
            //Student Survey Results
            if (surveyParams.ViewOption) {
                fileName = $"StudentSurveyResults_{careerEvent.Name}_{DateTime.Now:MM-dd-yyyy}.xlsx";
            }
            //Category Counts
            else {
                fileName = $"CategorySurveyResults_{careerEvent.Name}_{DateTime.Now:MM-dd-yyyy}.xlsx";
            }

            var stream = await _excelService.ExportToExcel(headers, rows, "Survey Results");

            Response.AddExcelHeader(fileName, _excelService.excelMimeType);

            return File(stream, _excelService.excelMimeType, fileName);
        }
    }
}