using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using CareerDayApi.Extensions;
using CareerDayApi.RequestHelpers;
using CareerDayApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    [Authorize(Roles = "Admin, FullLicenseUser")]
    public class ExportController(CareerDayContext context, ExcelService excelService,
        UserManager<User> userManager, ILogger<ExportController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly ExcelService _excelService = excelService;
        private readonly UserManager<User> _userManager = userManager;
        private readonly ILogger<ExportController> _logger = logger;

        /**
         * Exports the primary student schedule to .xlsx file.
         * Contains student Id, Student Name, Gender, Grade, Homeroom Teacher, (Home)Room
         * Sessions and room number if assigned.
         */
        [HttpGet("primarySchedule")]
        public async Task<ActionResult> ExportPrimarySchedule([FromQuery] EventIdDto eventIdDto)
        {
            var careerEvent = await _context.Events.FindAsync(eventIdDto.EventId);
            if (careerEvent == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (currentUser.LicenseId != careerEvent.LicenseId) return Forbid();
            
            var students = await _context.Students
                .Where(s => s.EventId == careerEvent.Id)
                .Include(s => s.Sessions).ThenInclude(s => s.Classroom)
                .Include(s => s.Sessions).ThenInclude(s => s.Speakers)
                .Include(s => s.Sessions).ThenInclude(s => s.Subject)
                .ToListAsync();

            if (students.Count == 0) return NotFound();

            // Find MAX session count, TODO should be passed as parameter
            var numOfSessions = students.Max(s => s.Sessions.Count);

            var headers = new List<string>(){
                "Student Id",
                "Last First Name",
                "Gender",
                "Grade",
                "Teacher",
                "Room"
            };

            for (var i = 1; i <= numOfSessions; i++)
            {
                headers.Add("Session " + i);
                headers.Add("Room " + i);
            }

            var rows = new List<object[]>();

            foreach(var student in students)
            {
                var sessions = student.Sessions.OrderBy(s => s.Period).ToList();
                var rowIndex = 5;

                var row = new object[rowIndex + numOfSessions * 2];
                row[0] = student.StudentNumber;
                row[1] = student.LastFirstName;
                row[2] = student.Gender;
                row[3] = student.Grade;
                row[4] = student.HomeroomTeacher;
                row[5] = string.IsNullOrEmpty(student.HomeroomNumber) ? string.Empty : student.HomeroomNumber;

                foreach(var session in sessions)
                {
                    var sessionRowIndex = (session.Period - 1) * 2 + 1 + rowIndex;
                    row[sessionRowIndex] = session.Subject.Name;
                    if (session.Classroom != null)
                        row[sessionRowIndex + 1] = session.Classroom.Building?[..Math.Min(session.Classroom.Building.Length, 8)]
                            + session.Classroom.RoomNumber?[..Math.Min(session.Classroom.RoomNumber.Length, 8)];
                }

                rows.Add(row);
            }

            List<bool> centeredCols = [true, false, true, true, false, true];

            for(int i = 0; i < numOfSessions; i++)
            {
                centeredCols.Add(false);
                centeredCols.Add(true);
            }

            string fileName = $"{careerEvent.Name}_{careerEvent.EventDate.ToString("MM-dd-yyyy")}_PrimarySchedule.xlsx";

            var stream = await _excelService.ExportToExcel(headers, rows, "Primary Schedule", centeredCols);

            Response.AddExcelHeader(fileName, _excelService.excelMimeType);

            return File(stream, _excelService.excelMimeType, fileName);
        }
    
        [HttpGet("studentsSchedule")]
        public async Task<ActionResult> ExportStudentsSchedule([FromQuery] EventIdDto eventIdDto)
        {
            var careerEvent = await _context.Events.FindAsync(eventIdDto.EventId);
            if (careerEvent == null) return NotFound();
            
            var currentUser = await _userManager.GetUserAsync(User);
            if (currentUser.LicenseId != careerEvent.LicenseId) return Forbid();

            var students = await _context.Students
                .Where(s => s.EventId == careerEvent.Id)
                .Include(s => s.Sessions).ThenInclude(s => s.Classroom)
                .Include(s => s.Sessions).ThenInclude(s => s.Speakers)
                .Include(s => s.Sessions).ThenInclude(s => s.Subject)
                .ToListAsync();

            if (students.Count == 0) return NotFound();

            string fileName = $"{careerEvent.Name}_{careerEvent.EventDate.ToString("MM-dd-yyy")}_StudentSchedules.xlsx";

            var stream = await _excelService.StudentScheduleToExcel(careerEvent.Name, students, "Student Schedules");

            Response.AddExcelHeader(fileName, _excelService.excelMimeType);
            
            return File(stream, _excelService.excelMimeType, fileName);
        }

        [HttpGet("roomsSchedule")]
        public async Task<ActionResult> ExportRoomsSchedule([FromQuery] EventIdDto eventIdDto)
        {
            var careerEvent = await _context.Events.FindAsync(eventIdDto.EventId);
            if (careerEvent == null) return NotFound();
            
            var currentUser = await _userManager.GetUserAsync(User);
            if (currentUser.LicenseId != careerEvent.LicenseId) return Forbid();

            var sessions = await _context.Sessions
                .Where(s => s.EventId == careerEvent.Id)
                .Include(s => s.Classroom)
                .Include(s => s.Students)
                .Include(s => s.Speakers)
                .Include(s => s.Subject)
                .OrderBy(s => s.Classroom.RoomNumber).ThenBy(s => s.Period)
                .ToListAsync();

            if (sessions.Count == 0) return NotFound();

            var headers = new List<string>()
            {
                "Teacher Name",
                "Room No.",
                "Enrolled",
                "Subject",
                "Period"
            };

            var maxNumOfSpeakers = sessions.Select(s => s.Speakers.Count).DefaultIfEmpty(0).Max();

            for (var i = 1; i <= maxNumOfSpeakers; i++)
            {
                headers.Add("Speaker " + i);
            }

            var rows = new List<object[]>();

            foreach(var session in sessions)
            {
                var rowIndex = 5;
                var row = new object[headers.Count];

                //Sessions Don't have a teacher associated to it.
                row[0] = "Placeholder teacher";
                if (session.Classroom != null)
                {
                    row[1] = session.Classroom.RoomNumber[..Math.Min(session.Classroom.RoomNumber.Length, 8)];
                }
                row[2] = session.Students.Count;
                row[3] = session.Subject.Name;
                row[4] = session.Period;

                foreach(var speaker in session.Speakers.ToList())
                {
                    row[rowIndex++] = speaker.FirstName + " " + speaker.LastName;
                }

                rows.Add(row);
            }

            List<bool> centeredCols = [false, true, true, false, true];

            string fileName = $"{careerEvent.Name}_{careerEvent.EventDate.ToString("MM-dd-yyyy")}_TeacherSchedule.xlsx";

            var stream = await _excelService.ExportToExcel(headers, rows, "Teacher Schedule", centeredCols);

            Response.AddExcelHeader(fileName, _excelService.excelMimeType);

            return File(stream, _excelService.excelMimeType, fileName);
        }

        /**
         * Exports the speaker schedule to excel.
         * Contains: Event Title, Speaker Name, List of Sessions, Rooms, Teacher, Subject
         * and number of students enrolled.
         */
        [HttpGet("speakersSchedule")]
        public async Task<ActionResult> ExportSpeakersSchedule([FromQuery] EventIdDto eventIdDto)
        {
            var careerEvent = await _context.Events.FindAsync(eventIdDto.EventId);
            if (careerEvent == null) return NotFound();

            var currentUser = await _userManager.GetUserAsync(User);
            if (currentUser.LicenseId != careerEvent.LicenseId) return Forbid();

            var speakers = await _context.Events
                .Where(e => e.Id == careerEvent.Id)
                .SelectMany(e => e.Speakers)
                .Include(s => s.Sessions.Where(session => session.EventId == careerEvent.Id))
                    .ThenInclude(session => session.Classroom)
                .Include(s => s.Sessions.Where(session => session.EventId == careerEvent.Id))
                    .ThenInclude(session => session.Subject)
                .Include(s => s.Sessions.Where(session => session.EventId == careerEvent.Id))
                    .ThenInclude(session => session.Students)
                .OrderBy(s => s.LastName).ThenBy(s => s.FirstName)
                .ToListAsync();

            if (speakers.Count == 0) return BadRequest(new ProblemDetails { Title = "No Speakers have been assigned" });

            string fileName = $"{careerEvent.Name}_{careerEvent.EventDate.ToString("MM-dd-yyy")}_SpeakerSchedules.xlsx";

            var stream = await _excelService.SpeakerScheduleToExcel(careerEvent.Name, speakers, "Speaker Schedules");

            Response.AddExcelHeader(fileName, _excelService.excelMimeType);
            
            return File(stream, _excelService.excelMimeType, fileName);
        }
    
        /**
         * Exports speakers by event or from the speakers page.
         *
         * Portrait?, Name, Title, Company, Email, Phone numbers, LastSchool, Subjects, Address
         */
        [HttpGet("speakers")]
        public async Task<ActionResult> ExportSpeakers([FromQuery] SpeakerExportParams speakerExportParams)
        {
            List<Speaker> speakers;
            Event careerEvent = null;
            var currentUser = await _userManager.GetUserAsync(User);
            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            if (speakerExportParams.EventId != null)
            {
                //Export Event Speakers
                careerEvent = await _context.Events
                    .FirstOrDefaultAsync(e => e.Id == speakerExportParams.EventId && e.LicenseId == currentLicenseId);

                if (careerEvent == null) return NotFound();

                speakers = await _context.Events
                    .Where(e => e.Id == speakerExportParams.EventId && e.LicenseId == currentLicenseId)
                    .SelectMany(e => e.Speakers)
                    .GetSpeakerDetails()
                    .ToListAsync();
            }
            else
            {
                //Export list of speakers provided
                if (!string.IsNullOrEmpty(speakerExportParams.SearchTerm))
                {
                    speakers = await _context.Speakers
                        .Where(s => s.LicenseId == currentLicenseId)
                        .Search(speakerExportParams.SearchTerm)
                        .GetSpeakerDetails()
                        .ToListAsync();
                }
                else
                {
                    speakers = await _context.Speakers
                        .Where(s => s.LicenseId == currentLicenseId)
                        .GetSpeakerDetails()
                        .ToListAsync();
                }
            }

            //Ensure Primary phone is first
            foreach(var speaker in speakers)
            {
                speaker.PhoneNumbers = speaker.PhoneNumbers
                    .OrderByDescending(p => p.IsPrimary)
                    .ThenBy(p => p.Type)
                    .ToList();
            }
            
            //Populate Headers
            var headers = new List<String>();
            var colCount = 0;
            
            if (speakerExportParams.IncludePortrait)
            {
                headers.Add("Portrait");
                colCount++;
            }

            headers.Add("Speaker Name");
            headers.Add("Title");
            headers.Add("Company");
            headers.Add("Email");
            headers.Add("Primary Phone");
            colCount += 5;

            var totalPhoneNumbers = speakers.Max(s => s.PhoneNumbers.Count);
            for (var i = 1; i < totalPhoneNumbers; i++)
            {
                headers.Add("Phone Number " + (i+1).ToString());
                colCount++;
            }

            if (speakerExportParams.IncludeLastSchool)
            {
                headers.Add("Last School Spoke At");
                colCount++;
            }

            var totalSubjects = speakers.Max(s => s.Careers.Count);
            if (speakerExportParams.IncludeSubjects)
            {
                if (totalSubjects == 1)
                {
                    headers.Add("Subject");
                    colCount++;
                }
                else
                {
                    for (var i = 1; i <= totalSubjects; i++)
                    {
                        headers.Add("Subject " + i);
                        colCount++;
                    }
                }
            }

            if (speakerExportParams.IncludeAddress)
            {
                headers.Add("Address");
                colCount++;
            }

            //Populate Rows
            var rows = new List<object[]>();

            foreach(var speaker in speakers)
            {
                var row = new object[colCount];
                var rowIndex = 0;

                if (speakerExportParams.IncludePortrait)
                {
                    row[rowIndex++] = speaker.PortraitUrl;
                }

                string[] name = [speaker.FirstName, speaker.MiddleName, speaker.LastName];
                row[rowIndex++] = string.Join(" ", name.Where(s => !string.IsNullOrEmpty(s)));
                row[rowIndex++] = speaker.Title;
                row[rowIndex++] = speaker.Company;
                row[rowIndex++] = speaker.Email;

                foreach(var phone in speaker.PhoneNumbers)
                {
                    string phoneNumber = string.IsNullOrEmpty(phone.Ext) ? phone.Number : phone.Number + " x" + phone.Ext;
                    row[rowIndex++] = phoneNumber;
                }
                for(int i = speaker.PhoneNumbers.Count; i < totalPhoneNumbers; i++)
                {
                    rowIndex++;
                }

                if (speakerExportParams.IncludeLastSchool)
                {
                    row[rowIndex++] = speaker.SchoolLastSpokeAt?.Name;
                }

                if (speakerExportParams.IncludeSubjects)
                {
                    foreach(var subject in speaker.Careers)
                    {
                        row[rowIndex++] = subject.Name;
                    }
                    for(int i = speaker.Careers.Count; i < totalSubjects; i++)
                    {
                        rowIndex++;
                    }
                }

                if (speakerExportParams.IncludeAddress)
                {
                    row[rowIndex++] = speaker.Address?.ToMultilineString();
                }

                rows.Add(row);
            }

            List<bool> centeredCols = [];
            for(int i = 0; i < colCount; i++)
            {
                centeredCols.Add(true);
            }

            //Populate Filename
            string fileName;

            if (careerEvent != null)
            {
                fileName = $"{careerEvent.Name}_Event_Speakers_{careerEvent.EventDate.ToString("MM-dd-yyy")}.xlsx";
            }
            else
            {
                if (speakerExportParams.DateString != null)
                {
                    fileName = $"Speakers_Export_{speakerExportParams.DateString}.xlsx";
                }
                else
                {
                    fileName = $"Speakers_Export_{DateTime.Today.ToString("MM-dd-yyyy")}.xlsx";
                }
            }

            var stream = await _excelService
                .ExportSpeakers(headers, rows, "Speakers", speakerExportParams.IncludePortrait, centeredCols);

            Response.AddExcelHeader(fileName, _excelService.excelMimeType);

            return File(stream, _excelService.excelMimeType, fileName);
        }
    }
}