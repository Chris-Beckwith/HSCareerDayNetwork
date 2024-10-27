using AutoMapper;
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using CareerDayApi.Extensions;
using CareerDayApi.RequestHelpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OfficeOpenXml;

namespace CareerDayApi.Controllers
{
    public class StudentController(CareerDayContext context,
        IMapper mapper, ILogger<StudentController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly IMapper _mapper = mapper;
        private readonly ILogger<StudentController> _logger = logger;

        [HttpGet]
        [Authorize(Roles = "Admin, SchoolUser")]
        public async Task<ActionResult<PagedList<Student>>> GetStudents([FromQuery] StudentParams studentParams)
        {
            var query = _context.Students
                .Search(studentParams.SearchTerm)
                .Filter(studentParams.Gender, studentParams.Grades,
                    studentParams.SurveyComplete, studentParams.EventId)
                .AsQueryable()
                .Include(s => s.School)
                .Include(s => s.Event).ThenInclude(e => e.School)
                .Include(s => s.Event).ThenInclude(e => e.EventPhase);

            var students = await PagedList<Student>.ToPagedList(query,
                studentParams.PageNumber, studentParams.PageSize);

            Response.AddPaginationHeader(students.MetaData);

            return students;
        }

        [HttpGet("{id}", Name = "GetStudent")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<Student>> GetStudent(int id)
        {
            return await _context.Students
                .Include(s => s.School)
                .Include(s => s.Event)
                .FirstOrDefaultAsync(s => s.Id == id);
        }

        [AllowAnonymous]
        [HttpGet("{eventId}/{studentNumber}")]
        public async Task<ActionResult<Student>> GetStudentByNumber(int eventId, string studentNumber)
        {
            return await _context.Students
                .Where(s => s.EventId == eventId && s.StudentNumber == studentNumber)
                .FirstOrDefaultAsync();
        }

        [HttpGet("GetSurveys")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<List<Survey>>> GetSurveys(int eventId, int pageNumber, int pageSize)
        {
            var query = _context.Surveys
                .Where(s => s.Student.EventId == eventId)
                .AsQueryable()
                .Include(s => s.Student)
                .Include(s => s.PrimaryCareers)
                .Include(s => s.AlternateCareers);

            var surveys = await PagedList<Survey>.ToPagedList(query, pageNumber, pageSize);

            Response.AddPaginationHeader(surveys.MetaData);

            return surveys;
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<Student>> CreateStudent(Student student)
        {
            if (await IsDuplicateStudentAsync(student.StudentNumber, student.Event, null))
            {
                throw new InvalidOperationException(
                    $"A student with student Id Number ({student.StudentNumber}) already exists for this event: {student.Event.Name}");
            }

            var school = await _context.Schools.FindAsync(student.School.Id);
            var studentEvent = await _context.Events.FindAsync(student.Event.Id);

            student.School = school;
            student.Event = studentEvent;

            _context.Students.Add(student);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return CreatedAtRoute("GetStudent", new { Id = student.Id }, student);

            return BadRequest(new ProblemDetails { Title = "Problem creating new student" });
        }

        [HttpPut]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<Student>> UpdateStudent([FromForm] UpdateStudentDto studentDto)
        {
            var student = await _context.Students.FindAsync(studentDto.Id);

            if (student == null) return NotFound();

            _mapper.Map(studentDto, student);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(student);

            return BadRequest(new ProblemDetails { Title = "Problem updating student" });
        }

        [AllowAnonymous]
        [HttpPost("SubmitSurvey")]
        public async Task<ActionResult> SubmitSurvey(Survey survey)
        {
            Student student = await _context.Students.FindAsync(survey.Student.Id);

            List<Career> primaryCareers = [];
            if (survey.PrimaryCareers != null && survey.PrimaryCareers.Count != 0) {
                primaryCareers = await _context.Careers
                                            .Where(s => survey.PrimaryCareers
                                                            .Select(dto => dto.Id)
                                                            .Contains(s.Id))
                                            .ToListAsync();
            }

            List<Career> alternateCareers = [];
            if (survey.AlternateCareers != null && survey.AlternateCareers.Count != 0) {
                alternateCareers = await _context.Careers
                                            .Where(s => survey.AlternateCareers
                                                            .Select(dto => dto.Id)
                                                            .Contains(s.Id))
                                            .ToListAsync();
            }

            if (student == null) {
                _logger.LogError("Error submitting survey: Student not found: {student}, {studentId}",
                    survey.Student, survey.Student.Id);
                return BadRequest(new ProblemDetails { Title = "Problem updating event: School not found"});
            }
            if (primaryCareers == null) {
                _logger.LogError("Error submitting survey: Primary Careers not found: {careers}",
                    survey.PrimaryCareers);
                return BadRequest(new ProblemDetails { Title = "Problem submitting survey: Careers not found"});
            }
            if (alternateCareers == null) {
                _logger.LogError("Error submitting survey: Alternate Careers not found: {careers}",
                    survey.AlternateCareers);
                return BadRequest(new ProblemDetails { Title = "Problem submitting survey: Careers not found"});
            }

            student.SurveyComplete = true;

            survey.Student = student;
            survey.PrimaryCareers.RemoveRange(0, survey.PrimaryCareers.Count);
            survey.AlternateCareers.RemoveRange(0, survey.AlternateCareers.Count);
            foreach (var career in primaryCareers)
            {
                survey.PrimaryCareers.Add(career);
            }
            foreach (var career in alternateCareers)
            {
                survey.AlternateCareers.Add(career);
            }

            try {
                _context.Surveys.Add(survey);

                var result = await _context.SaveChangesAsync() > 0;

                if (result) return Ok();
            } 
            catch (DbUpdateException e) when (IsUniqueConstraintException(e))
            {
                return Conflict(new { message = GetAndLogErrorMsg(e) });
            }

            return BadRequest(new ProblemDetails { Title = "Problem submitting survey" });
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult> DeleteStudent(int id)
        {
            var student = await _context.Students.FindAsync(id);

            if (student == null) return NotFound();

            _context.Students.Remove(student);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting student" });
        }

        [HttpDelete("DeleteAll/{eventId}", Name = "DeleteAll")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult> DeleteAllStudents(int eventId)
        {
            var students = await _context.Students.Where(s => s.EventId == eventId).ToListAsync();

            if (students == null) return NotFound();

            _context.Students.RemoveRange(students);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem with delete all students method" });
        }

        [HttpPost("ImportStudents", Name = "ImportStudents")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult> ImportStudents([FromForm] ImportStudentsDto importStudentsDto)
        {
            var careerEvent = await _context.Events
                .Where(e => e.Id == importStudentsDto.EventId)
                .Include(e => e.EventPhase)
                .Include(e => e.Careers)
                .Include(e => e.Speakers)
                .Include(e => e.School)
                .FirstOrDefaultAsync();

            if (importStudentsDto.File == null || importStudentsDto.File.Length == 0)
                return BadRequest(new ProblemDetails { Title = "No File found for student import" });

            using var stream = new MemoryStream();
            await importStudentsDto.File.CopyToAsync(stream);
            var data = stream.ToArray();

            var (isValid, error, students) = await ParseStudentExcelAsync(data, careerEvent);

            if (!isValid) return BadRequest(new ProblemDetails { Title = error });

            try
            {
                const int batchSize = 1000;
                var batchCount = 0;
                var batch = new List<Student>();

                foreach (var student in students)
                {
                    if (await IsDuplicateStudentAsync(student.StudentNumber, student.Event, batch))
                    {
                        return BadRequest(new ProblemDetails
                        {
                            Title =
                            $"A student with student Id Number ({student.StudentNumber}) already exists for event: '{student.Event.Name}'."
                            + $" The first {batchCount * batchSize} Students were already processed and added to the database."
                        });
                    }
                    batch.Add(student);

                    if (batch.Count >= batchSize)
                    {
                        await _context.Students.AddRangeAsync(batch);
                        var result = await _context.SaveChangesAsync() > 0;
                        if (!result)
                        {
                            return BadRequest(new ProblemDetails { Title = "Problem processing and importing students" });
                        }
                        batch.Clear();
                        batchCount++;
                    }
                }

                if (batch.Count > 0)
                {
                    await _context.Students.AddRangeAsync(batch);
                    var result = await _context.SaveChangesAsync() > 0;
                    if (!result)
                    {
                        return BadRequest(new ProblemDetails { Title = "Problem processing and importing students" });
                    }
                }
            }
            catch (DbUpdateException e) when (IsUniqueConstraintException(e))
            {
                return Conflict(new { message = GetAndLogErrorMsg(e) });
            }
            
            var msg = "Students Imported Successfully";
            if (!string.IsNullOrEmpty(error)) {
                msg = error;
            }

            return Ok(new { message = msg });
        }

        [HttpGet("export")]
        [Authorize(Roles = "Admin, SchoolUser")]
        public async Task<ActionResult> ExportStudents([FromQuery] StudentParams studentParams)
        {
            var students = await _context.Students
                .Search(studentParams.SearchTerm)
                .Filter(studentParams.Gender, studentParams.Grades,
                    studentParams.SurveyComplete, studentParams.EventId)
                .Include(s => s.School)
                .Include(s => s.Event)
                .ToListAsync();


            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using ExcelPackage excelPackage = new();
            ExcelWorksheet worksheet = excelPackage.Workbook.Worksheets.Add("Students");

            //Headers
            worksheet.Cells[1, 1].Value = "Student Number";
            worksheet.Cells[1, 2].Value = "Last, First Name";
            worksheet.Cells[1, 3].Value = "Last Name";
            worksheet.Cells[1, 4].Value = "First Name";
            worksheet.Cells[1, 5].Value = "Gender";
            worksheet.Cells[1, 6].Value = "Grade";
            worksheet.Cells[1, 7].Value = "Email";
            worksheet.Cells[1, 8].Value = "Teacher";
            worksheet.Cells[1, 9].Value = "Room";
            worksheet.Cells[1, 10].Value = "Survey Complete";

            for (int i = 0; i < students.Count; i++)
            {
                worksheet.Cells[i + 2, 1].Value = students[i].StudentNumber;
                worksheet.Cells[i + 2, 2].Value = students[i].LastFirstName;
                worksheet.Cells[i + 2, 3].Value = students[i].LastName;
                worksheet.Cells[i + 2, 4].Value = students[i].FirstName;
                worksheet.Cells[i + 2, 5].Value = students[i].Gender;
                worksheet.Cells[i + 2, 6].Value = students[i].Grade;
                worksheet.Cells[i + 2, 7].Value = students[i].Email;
                worksheet.Cells[i + 2, 8].Value = students[i].HomeroomTeacher;
                worksheet.Cells[i + 2, 9].Value = students[i].HomeroomNumber;
                worksheet.Cells[i + 2, 10].Value = students[i].SurveyComplete;
            }

            var stream = new MemoryStream();
            excelPackage.SaveAs(stream);
            stream.Position = 0;

            var fileName = "Students_" + students[0].School.Name + "_" + DateTime.Now.ToString("MM-dd-yyyy");
            return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
        }

        private async Task<(bool isValid, string error, List<Student>)> ParseStudentExcelAsync(byte[] fileData, Event careerEvent)
        {
            var students = new List<Student>();
            var error = string.Empty;
            var warningCount = 0;

            using var stream = new MemoryStream(fileData);
            using var package = new ExcelPackage(stream);
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            var worksheet = package.Workbook.Worksheets[0];

            if (!worksheet.Cells[1, 1].Text.ToLower().Contains("school")
                || (!worksheet.Cells[1, 2].Text.ToLower().Equals("student_number") && !worksheet.Cells[1, 2].Text.ToLower().Equals("id"))
                || !worksheet.Cells[1, 3].Text.ToLower().Equals("lastfirst")
                || !worksheet.Cells[1, 4].Text.ToLower().Contains("last")
                || !worksheet.Cells[1, 5].Text.ToLower().Contains("first")
                || !worksheet.Cells[1, 6].Text.ToLower().Contains("gender")
                || !worksheet.Cells[1, 7].Text.ToLower().Contains("grade")
                || !worksheet.Cells[1, 8].Text.ToLower().Equals("student email")
                || !worksheet.Cells[1, 9].Text.ToLower().Contains("teacher")
                // || !worksheet.Cells[1, 10].Text.ToLower().Equals("course name")
                || !worksheet.Cells[1, 11].Text.ToLower().Contains("room"))
            {
                return (false, "Invalid column headers", null);
            }

            var school = await _context.Schools.FindAsync(careerEvent.School.Id);

            for (int row = 2; row <= worksheet.Dimension.Rows; row++)
            {
                if (string.IsNullOrEmpty(worksheet.Cells[row, 2].Text.Trim()))
                {
                    continue;
                }
                var student = new Student
                {
                    School = school,
                    StudentNumber = worksheet.Cells[row, 2].Text,
                    LastFirstName = worksheet.Cells[row, 3].Text,
                    LastName = worksheet.Cells[row, 4].Text,
                    FirstName = worksheet.Cells[row, 5].Text,
                    Gender = worksheet.Cells[row, 6].Text,
                    Grade = Int32.Parse(worksheet.Cells[row, 7].Text),
                    Email = worksheet.Cells[row, 8].Text,
                    HomeroomTeacher = worksheet.Cells[row, 9].Text,
                    HomeroomNumber = worksheet.Cells[row, 11].Text,
                    Event = careerEvent
                };

                if (!IsFullyPopulatedStudent(student)) {
                    warningCount++;
                }

                students.Add(student);
            }
            if (warningCount > 0) {
                error = warningCount + " Student(s) found with incomplete information";
            }

            return (true, error, students);
        }

        private async Task<bool> IsDuplicateStudentAsync(string studentNumber, Event careerEvent, List<Student> batch)
        {
            if (batch != null && batch.Any(s => s.StudentNumber == studentNumber && s.Event == careerEvent))
                return true;

            return await _context.Students
                .AnyAsync(s => s.StudentNumber == studentNumber && s.Event == careerEvent);
        }

        private static bool IsUniqueConstraintException(DbUpdateException e)
        {
            return e.InnerException != null 
                && (e.InnerException.Message.Contains("23503") || e.InnerException.Message.Contains("23505"));
        }

        private string GetAndLogErrorMsg(DbUpdateException e)
        {
            var msg = "A unqiue contraint exception has occurred";
            if (e.InnerException.Message.Contains("Students_StudentNumber_EventId"))
            {
                msg = "A student with a matching student number already exists with this event";
            }
            else if (e.InnerException.Message.Contains("Surveys_StudentId"))
            {
                msg = "A survey has already been submitted for this student";
            }
            _logger.LogError(e, "An error occurred creating a student");
            return msg;
        }

        private bool IsFullyPopulatedStudent(Student student)
        {
            return !string.IsNullOrEmpty(student.StudentNumber) &&
                !string.IsNullOrEmpty(student.LastFirstName) &&
                !string.IsNullOrEmpty(student.LastName) &&
                !string.IsNullOrEmpty(student.FirstName) &&
                !string.IsNullOrEmpty(student.Gender) &&
                !string.IsNullOrEmpty(student.Email) &&
                !string.IsNullOrEmpty(student.HomeroomTeacher) &&
                !string.IsNullOrEmpty(student.HomeroomNumber) &&
                student.Grade > 0;
        }
    }
}