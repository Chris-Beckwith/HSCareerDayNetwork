
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
    public class SchedulingController(CareerDayContext context, ExcelService excelService,
        IMapper mapper, ILogger<SchedulingController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly ExcelService _excelService = excelService;
        private readonly IMapper _mapper = mapper;
        private readonly ILogger<SchedulingController> _logger = logger;

        [HttpPost]
        public async Task<ActionResult<List<Session>>> GenerateSchedule([FromForm] GenerateScheduleParamsDto generateScheduleParamsDto)
        {
            var surveys = await _context.Surveys
                                        .Include(s => s.Student)
                                        .Include(s => s.PrimaryCareers)
                                        .Include(s => s.AlternateCareers)
                                        .Where(s => s.Student.EventId == generateScheduleParamsDto.EventId).ToListAsync();

            var maxClassSize = generateScheduleParamsDto.MaxClassSize;

            // Dictionary to count the number of times each primary career is selected
            var primaryCareerCounts = surveys
                .SelectMany(s => s.PrimaryCareers)
                .GroupBy(c => c)
                .ToDictionary(g => g.Key, g => g.Count());

            // Sort the surveys list based on primary career popularity, then gender, then grade
            var sortedSurveys = surveys
                .OrderBy(s => s.PrimaryCareers.Max(c => primaryCareerCounts.TryGetValue(c, out int value) ? value : 0))
                .ThenByDescending(s => s.Student.Grade)
                .ThenBy(s => s.Student.Gender)
                .ToList();
            
            // Initialize Periods
            var periods = new List<List<Session>>();
            for (int i = 0; i < generateScheduleParamsDto.PeriodCount; i++)
            {
                var sessionList = new List<Session>();
                periods.Add(sessionList);
            }
            
            // Initialize Sessions
            var allSessions = new List<Session>();

            var sameSpeakerCareers = new List<Career>();

            //Add Same Speaker sessions first
            if (generateScheduleParamsDto.SameSpeakersForCareerList != null) {
                foreach(var sameSpeakers in generateScheduleParamsDto.SameSpeakersForCareerList)
                {
                    var studentCount = 0;
                    foreach(var career in sameSpeakers)
                    {
                        var sameSpeakerCareer = primaryCareerCounts.Where(c => c.Key.Id == career.Id).FirstOrDefault();
                        studentCount += sameSpeakerCareer.Value;
                        sameSpeakerCareers.Add(sameSpeakerCareer.Key);
                    }

                    var count = new KeyValuePair<Career, int>(sameSpeakers[0], studentCount);
                    AddRestrictedSession(generateScheduleParamsDto, count, allSessions, periods);
                }
            }

            //Add the rest, excluding the same speaker careers/subject
            foreach(var count in primaryCareerCounts)
            {
                if (!sameSpeakerCareers.Contains(count.Key)) {
                    AddRestrictedSession(generateScheduleParamsDto, count, allSessions, periods);
                }
            }

            // Initialize Session population map TODO this can be replaced by allSessions right???
            var sessionPopulation = new Dictionary<Session, int>();
            foreach(var session in allSessions)
            {
                sessionPopulation[session] = 0;
            }

            List<Session> FindSessionsForCareerSorted(Career career)
            {
                return sessionPopulation
                    .Where(kvp => kvp.Key.Subject.Id == career.Id && kvp.Value < maxClassSize)
                    .OrderBy(kvp => kvp.Value)
                    .Select(kvp => kvp.Key)
                    .ToList();
            }

            Career FindSameSpeakerCareer(Career career)
            {
                if (generateScheduleParamsDto.SameSpeakersForCareerList != null) {
                    foreach (var careerArray in generateScheduleParamsDto.SameSpeakersForCareerList)
                    {
                        if (careerArray.Any(c => c.Id == career.Id))
                        {
                            return careerArray.First();
                        }
                    }
                }
                return career;
            }

            // Initialize Conflict Map
            var conflictMap = new Dictionary<int, HashSet<Student>>();
            for (int i = 0; i < periods.Count; i++)
            {
                conflictMap[i] = new HashSet<Student>();
            }

            // Initialize Unplaced Students
            var unplacedStudents = new List<UnplacedStudentDto>();

            // Assign Students
            foreach(Survey survey in sortedSurveys)
            {
                foreach(Career pCareer in survey.PrimaryCareers)
                {
                    bool isAdded = false;

                    var actualPCareer = FindSameSpeakerCareer(pCareer);

                    // Find session for that career with least students
                    var sessions = FindSessionsForCareerSorted(actualPCareer);
                    foreach(Session session in sessions)
                    {
                        // If period not assigned, Find periods with least sessions and no session with current session's career subject
                        // Else, check if student already has session in that period
                        if (session.Period == 0) {
                            // Check if restricted.
                            var restrictPeriods = generateScheduleParamsDto.RequiredPeriodForCareerList[session.Subject.Id];

                            var allowedPeriods = Enumerable.Range(0, generateScheduleParamsDto.PeriodCount);
                            
                            if (restrictPeriods.Count(p => p == 0) < generateScheduleParamsDto.PeriodCount) {
                                allowedPeriods = restrictPeriods.Contains(1)
                                    ? restrictPeriods.Select((value, index) => value == 1 ? index : -1).Where(index => index != -1).ToList()
                                    : restrictPeriods.Select((value, index) => value == 2 ? -1 : index).Where(index => index != -1).ToList();
                            }

                            // Session not assigned period, find a period
                            var careerSubjectCounts = periods
                                .Select(period => period.Count(s => s.Subject == session.Subject))
                                .ToList();

                            // Determine the minimum count of sessions for the specified career subject
                            int minCount = careerSubjectCounts.Min();

                            // Return only those periods with the minimum count of sessions of that subject
                            var availablePeriods = periods
                                .Select((period, index) => new { Period = period, Index = index })
                                .Where(x => careerSubjectCounts[x.Index] == minCount && allowedPeriods.Contains(x.Index))
                                .OrderBy(x => x.Period.Count)
                                .ToList();
                            
                            foreach(var availPeriod in availablePeriods)
                            {
                                int periodIndex = availPeriod.Index;

                                // Check for conflict
                                bool hasConflict = conflictMap[periodIndex].Contains(survey.Student);

                                if (!hasConflict) {
                                    // Add Student to session
                                    session.AddStudent(survey.Student);
                                    // Add Session to period
                                    session.Period = periodIndex + 1;
                                    periods[periodIndex].Add(session);
                                    // Add Student to conflict map
                                    conflictMap[periodIndex].Add(survey.Student);
                                    // Increment session population
                                    sessionPopulation[session]++;

                                    isAdded = true;

                                    break;
                                }
                            }
                        } else {
                            // Session already has period
                            bool hasConflict = conflictMap[session.Period - 1].Contains(survey.Student);

                            if (!hasConflict) {
                                //Add Student to session
                                session.AddStudent(survey.Student);
                                //Add Student to conflict map
                                conflictMap[session.Period - 1].Add(survey.Student);
                                //Increment session population
                                sessionPopulation[session]++;

                                isAdded = true;

                                break;
                            }
                        }
                        if (isAdded) break;
                    }

                    // If Conflict, add Student, Conflicting PrimaryCareer
                    if (!isAdded) {
                        unplacedStudents.Add(new UnplacedStudentDto
                            {
                                Student = survey.Student,
                                Career = actualPCareer
                            });
                    }
                }
            }

            var placedStudents = new List<UnplacedStudentDto>();

            foreach(UnplacedStudentDto unplacedStudentCareer in unplacedStudents)
            {
                Student unplacedStudent = unplacedStudentCareer.Student;
                Career unplacedCareer = unplacedStudentCareer.Career;
                bool isAdded = false;

                // Find each period they are enrolled in a session
                var enrolledPeriods = allSessions
                    .Where(session => session.Students.Contains(unplacedStudent))
                    .Select(session => session.Period - 1)
                    .ToList();

                List<Session> enrolledSessions = [];
                for (int index = 0; index < periods.Count; index++)
                {
                    Session enrolledSession = periods[index]
                        .Where(session => session.Students.Contains(unplacedStudent))
                        .FirstOrDefault();

                    if (enrolledSession != null) {
                        enrolledSessions.Add(enrolledSession);
                    }
                }

                // Find enrolledSession that can move to open period
                foreach(Session enrolledSession in enrolledSessions)
                {
                    for(int i = 0; i < periods.Count; i++)
                    {
                        // Open Period
                        if (!enrolledPeriods.Contains(i)) {
                            // Available session
                            Session openSession = periods[i]
                                .Where(session => session.Subject.Id == enrolledSession.Subject.Id && session.Students.Count < maxClassSize)
                                .OrderBy(session => session.Students.Count)
                                .FirstOrDefault();

                            Session sessionToPlace = periods[enrolledSession.Period - 1]
                                .Where(session => session.Subject.Id == unplacedCareer.Id && session.Students.Count < maxClassSize)
                                .OrderBy(session => session.Students.Count)
                                .FirstOrDefault();

                            if (openSession != null && sessionToPlace != null) {
                                // enrolledSession to openSession
                                // sessionToPlace to enrolledSession
                                // Session found, make the swap
                                // Remove student from enrolled Session
                                enrolledSession.RemoveStudent(unplacedStudent.Id);
                                // Remove student from conflict map
                                conflictMap[enrolledSession.Period - 1].Remove(unplacedStudent);
                                // Decrement sessionPopulation
                                sessionPopulation[enrolledSession]--;

                                // Add student to openSession
                                openSession.AddStudent(unplacedStudent);
                                // Add student to conflict map
                                conflictMap[openSession.Period - 1].Add(unplacedStudent);
                                // Increment sessionPopulation
                                sessionPopulation[openSession]++;

                                // Add student to sessionToPlace
                                sessionToPlace.AddStudent(unplacedStudent);
                                // Add student to conflict map
                                conflictMap[sessionToPlace.Period - 1].Add(unplacedStudent);
                                // Increment sessionPopulation
                                sessionPopulation[sessionToPlace]++;

                                // Placed Student
                                placedStudents.Add(unplacedStudentCareer);
                                isAdded = true;
                                break;
                            } else if (openSession != null || sessionToPlace != null) {
                                // Check other enrolledSessions for session to place
                                foreach(Session otherEnrolledSession in enrolledSessions.Where(s => s != enrolledSession))
                                {
                                    // enrolledSession.period has session for unplaced career
                                    // enrolledSession can NOT go in open period
                                    
                                    // Can otherEnrolledSession go in open period? 
                                    // AND can enrolledSession go in otherEnrolledSession.period

                                    // sessionToPlace go into entrolledSession.period
                                    // entrolledSession go into otherEnrolledSession.period
                                    // otherEnrolledSession go into open.period
                                    if (sessionToPlace != null && openSession == null) {
                                        openSession = periods[i]
                                            .Where(session => session.Subject.Id == otherEnrolledSession.Subject.Id && session.Students.Count < maxClassSize)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        Session enrolledToOtherEnrolled = periods[otherEnrolledSession.Period - 1]
                                            .Where(session => session.Subject.Id == enrolledSession.Subject.Id && session.Students.Count < maxClassSize)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        if (openSession != null && enrolledToOtherEnrolled != null) {
                                            // sessionToPlace go into entrolledSession.period
                                            // entrolledSession go into otherEnrolledSession.period
                                            // otherEnrolledSession go into open.period

                                            // Session found, make the swap
                                            // Remove student from enrolled Session
                                            enrolledSession.RemoveStudent(unplacedStudent.Id);
                                            // Remove student from conflict map
                                            conflictMap[enrolledSession.Period - 1].Remove(unplacedStudent);
                                            // Decrement sessionPopulation
                                            sessionPopulation[enrolledSession]--;

                                            // Add student to sessionToPlace
                                            sessionToPlace.AddStudent(unplacedStudent);
                                            // Add student to conflict map
                                            conflictMap[sessionToPlace.Period - 1].Add(unplacedStudent);
                                            // Increment sessionPopulation
                                            sessionPopulation[sessionToPlace]++;

                                            //Remove student from otherEnrolledSession
                                            otherEnrolledSession.RemoveStudent(unplacedStudent.Id);
                                            //Remove student from conflict map
                                            conflictMap[otherEnrolledSession.Period - 1].Remove(unplacedStudent);
                                            //Decrement sessionPopulation
                                            sessionPopulation[otherEnrolledSession]++;

                                            //Add entrolledSession to otherEnrolledSession
                                            enrolledToOtherEnrolled.AddStudent(unplacedStudent);
                                            //Add student to conflict map
                                            conflictMap[enrolledToOtherEnrolled.Period - 1].Add(unplacedStudent);
                                            //Increment sessionPopulation
                                            sessionPopulation[enrolledToOtherEnrolled]++;

                                            // Add otherEnrolledSession to openSession
                                            openSession.AddStudent(unplacedStudent);
                                            // Add student to conflict map
                                            conflictMap[openSession.Period - 1].Add(unplacedStudent);
                                            // Increment sessionPopulation
                                            sessionPopulation[openSession]++;

                                            // Placed Student
                                            placedStudents.Add(unplacedStudentCareer);
                                            isAdded = true;
                                            break;
                                        }
                                    }

                                    // enrolledSession can go in open period
                                    // sessonToPlace can NOT go in enrolledSession.period

                                    // Can otherEnrolledSession go into enrolledSession.period
                                    // AND sessionToPlace go in otherEnrolledSession.period?

                                    // enrolledSession go into open.period
                                    // otherEnrolledSession go into enrolledSession.period
                                    // sessionToPlace go into otherEnrolledSession.period
                                    if (openSession != null && sessionToPlace == null) {
                                        sessionToPlace = periods[otherEnrolledSession.Period - 1]
                                            .Where(session => session.Subject.Id == unplacedCareer.Id && session.Students.Count < maxClassSize)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        Session otherEnrolledToEnrolled = periods[enrolledSession.Period - 1]
                                            .Where(session => session.Subject.Id == otherEnrolledSession.Subject.Id && session.Students.Count < maxClassSize)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        if (sessionToPlace != null && otherEnrolledToEnrolled != null) {
                                            // Remove student from enrolled Session
                                            enrolledSession.RemoveStudent(unplacedStudent.Id);
                                            // Remove student from conflict map
                                            conflictMap[enrolledSession.Period - 1].Remove(unplacedStudent);
                                            // Decrement sessionPopulation
                                            sessionPopulation[enrolledSession]--;

                                            // Add student to sessionToPlace
                                            sessionToPlace.AddStudent(unplacedStudent);
                                            // Add student to conflict map
                                            conflictMap[sessionToPlace.Period - 1].Add(unplacedStudent);
                                            // Increment sessionPopulation
                                            sessionPopulation[sessionToPlace]++;

                                            //Remove student from otherEnrolledSession
                                            otherEnrolledSession.RemoveStudent(unplacedStudent.Id);
                                            //Remove student from conflict map
                                            conflictMap[otherEnrolledSession.Period - 1].Remove(unplacedStudent);
                                            //Decrement sessionPopulation
                                            sessionPopulation[otherEnrolledSession]++;

                                            //Add entrolledSession to otherEnrolledSession
                                            otherEnrolledToEnrolled.AddStudent(unplacedStudent);
                                            //Add student to conflict map
                                            conflictMap[otherEnrolledToEnrolled.Period - 1].Add(unplacedStudent);
                                            //Increment sessionPopulation
                                            sessionPopulation[otherEnrolledToEnrolled]++;

                                            // Add student to openSession
                                            openSession.AddStudent(unplacedStudent);
                                            // Add student to conflict map
                                            conflictMap[openSession.Period - 1].Add(unplacedStudent);
                                            // Increment sessionPopulation
                                            sessionPopulation[openSession]++;

                                            // Placed Student
                                            placedStudents.Add(unplacedStudentCareer);
                                            isAdded = true;
                                            break;
                                        }
                                    }

                                    // enrolledSession can NOT go into open.period
                                    // sessionToPlace can NOT go into enrolledSession.period

                                    // Can sessionToPlace go into otherEnrolledSession.period
                                    // Can otherEnrolledSession go into open.period
                                    if (openSession == null && sessionToPlace == null) {
                                        openSession = periods[i]
                                            .Where(session => session.Subject.Id == otherEnrolledSession.Subject.Id && session.Students.Count < maxClassSize)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        sessionToPlace = periods[otherEnrolledSession.Period - 1]
                                            .Where(session => session.Subject.Id == unplacedCareer.Id && session.Students.Count < maxClassSize)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();
                                        
                                        if (openSession != null && sessionToPlace != null) {
                                            // otherEnrolledSession to openSession
                                            // sessionToPlace to otherEnrolledSession
                                            // Session found, make the swap
                                            // Remove student from enrolled Session
                                            otherEnrolledSession.RemoveStudent(unplacedStudent.Id);
                                            // Remove student from conflict map
                                            conflictMap[otherEnrolledSession.Period - 1].Remove(unplacedStudent);
                                            // Decrement sessionPopulation
                                            sessionPopulation[otherEnrolledSession]--;

                                            // Add student to openSession
                                            openSession.AddStudent(unplacedStudent);
                                            // Add student to conflict map
                                            conflictMap[openSession.Period - 1].Add(unplacedStudent);
                                            // Increment sessionPopulation
                                            sessionPopulation[openSession]++;

                                            // Add student to sessionToPlace
                                            sessionToPlace.AddStudent(unplacedStudent);
                                            // Add student to conflict map
                                            conflictMap[sessionToPlace.Period - 1].Add(unplacedStudent);
                                            // Increment sessionPopulation
                                            sessionPopulation[sessionToPlace]++;

                                            // Placed Student
                                            placedStudents.Add(unplacedStudentCareer);
                                            isAdded = true;
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (isAdded) break;
                }
            }

            foreach(var studentToRemove in placedStudents)
            {
                unplacedStudents.Remove(studentToRemove);
            }

            foreach(var unplacedStudent in unplacedStudents)
            {
                for(var i = 0; i < generateScheduleParamsDto.PeriodCount; i++)
                {
                    if (!conflictMap[i].Contains(unplacedStudent.Student)) {
                        unplacedStudent.Period = i + 1;
                    }
                }
            }

            var periodCounts = periods
                .Select(period => period.SelectMany(s => s.Students).ToList().Count)
                .ToList();
            
            var result = new ScheduleResultDto
            {
                AllSessions = allSessions,
                PeriodCounts = periodCounts,
                UnplacedStudents = unplacedStudents
            };

            return Ok(result);
        }

        private static void AddRestrictedSession(GenerateScheduleParamsDto generateScheduleParamsDto, KeyValuePair<Career, int> count,
            List<Session> allSessions, List<List<Session>> periods)
        {
            // If allowed periods > totalSessions, partially restricted ("OR" restriction)
                // add without period
            // If allowed periods < totalSessions
                // allowed periods % totalSessions, split evenly add
                // else add all but extra (1 or 2)
            // If allowed periods = totalSessions, add

            var restrictPeriods = generateScheduleParamsDto.RequiredPeriodForCareerList[count.Key.Id];
            
            //TODO if a career has requested additional sessions, add here (from generateScheduleParamsDto)
            var totalSessions = Math.Ceiling((double)count.Value / generateScheduleParamsDto.MaxClassSize);

            // Number of restricted periods is not equal to the total periods
            if (restrictPeriods.Count(p => p == 0) < generateScheduleParamsDto.PeriodCount) {
                // Get periods allowed for subject/career
                var allowedPeriods = restrictPeriods.Contains(1)
                    ? restrictPeriods.Select((value, index) => value == 1 ? index : -1).Where(index => index != -1).ToList()
                    : restrictPeriods.Select((value, index) => value == 2 ? -1 : index).Where(index => index != -1).ToList();

                // Allowed periods greater than the number of sessions for a subject
                // Pick a period when placing students
                if (allowedPeriods.Count > totalSessions) {
                    for (var i = 0; i < totalSessions; i++)
                    {
                        allSessions.Add(new Session
                        {
                            Subject = count.Key,
                            EventId = generateScheduleParamsDto.EventId
                        });
                    }
                // Multiple careers will need to be placed in the same period (rare case)
                // Assign evenly in each allowed period,
                // then add any remaining without period to be assigned when placing students.
                } else if (allowedPeriods.Count < totalSessions) {
                    var availableCount = allowedPeriods.Count;
                    while (availableCount <= totalSessions)
                    {
                        foreach (var period in allowedPeriods)
                        {
                            var newSession = new Session
                            {
                                Period = period + 1,
                                Subject = count.Key,
                                EventId = generateScheduleParamsDto.EventId
                            };
                            periods[period].Add(newSession);
                            allSessions.Add(newSession);
                            totalSessions--;
                        }
                    }
                    for (var i = 0; i < totalSessions; i++)
                    {
                        allSessions.Add(new Session
                        {
                            Subject = count.Key,
                            EventId = generateScheduleParamsDto.EventId
                        });
                    }
                // Most common case
                // Even allowed periods and number of sessions, place one session in each allowed period
                } else {
                    foreach (var period in allowedPeriods)
                    {
                        var newSession = new Session
                        {
                            Period = period + 1,
                            Subject = count.Key,
                            EventId = generateScheduleParamsDto.EventId
                        };
                        periods[period].Add(newSession);
                        allSessions.Add(newSession);
                    }
                }
            // Unrestricted Subject/Career
            } else {
                for (var i = 0; i < totalSessions; i++)
                {
                    allSessions.Add(new Session
                    {
                        Subject = count.Key,
                        EventId = generateScheduleParamsDto.EventId
                    });
                }
            }
        }

        [HttpGet("{eventId}")]
        public async Task<ActionResult<List<Session>>> GetSessionsAndUnplaced(int eventId)
        {
            var sessions = await _context.Sessions.Where(s => s.EventId == eventId)
                .Include(s => s.Classroom).ThenInclude(c => c.School)
                .Include(s => s.Students).ThenInclude(st => st.School)
                .Include(s => s.Speakers).ThenInclude(sp => sp.SchoolLastSpokeAt)
                .Include(s => s.Speakers).ThenInclude(sp => sp.Address)
                .Include(s => s.Speakers).ThenInclude(sp => sp.Careers)
                .Include(s => s.Subject)
                .ToListAsync();

            var unplacedStudents = new List<SessionUnplacedStudentDto>();

            var students = await _context.Students.Where(s => s.EventId == eventId)
                .Include(s => s.Sessions).ThenInclude(s => s.Subject)
                .Where(s => s.Sessions.Count < _context.Surveys
                    .Where(sv => sv.Student.Id == s.Id)
                    .Select(sv => sv.PrimaryCareers.Count)
                    .FirstOrDefault())
                .ToListAsync();

            var surveys = await _context.Surveys
                .Include(s => s.Student)
                .Include(s => s.PrimaryCareers)
                .Include(s => s.AlternateCareers)
                .Where(s => s.Student.EventId == eventId).ToListAsync();

            var numOfSessions = surveys[0].PrimaryCareers.Count;

            foreach (var student in students)
            {
                var survey = surveys.FirstOrDefault(s => s.Student.Id == student.Id);
                if (survey == null || survey.PrimaryCareers == null || survey.PrimaryCareers.Count == 0)
                    continue;

                var primaryCareers = survey.PrimaryCareers;

                var sessionSubjects = student.Sessions.Select(s => s.Subject).ToList();

                var missingCareers = primaryCareers.Where(pc => !sessionSubjects.Contains(pc)).ToList();

                foreach(var career in missingCareers)
                {
                    unplacedStudents.Add(new SessionUnplacedStudentDto
                    {
                        Student = _mapper.Map(student, new StudentDto()),
                        Career = career
                    });
                }
            }

            var allSessions = sessions.Select(session => new SessionDto
            {
                Id = session.Id,
                Classroom = session.Classroom,
                Students = session.Students.Select(st => _mapper.Map(st, new StudentDto())).ToList(),
                Speakers = session.Speakers.Select(sp => _mapper.Map(sp, new SpeakerDto())).ToList(),
                Period = session.Period,
                Subject = session.Subject,
                EventId = session.EventId
            }).ToList();

            var result = new SessionResultDto
            {
                AllSessions = allSessions,
                UnplacedStudents = unplacedStudents
            };

            return Ok(result);
        }

        [HttpPost("save")]
        public async Task<ActionResult<List<Session>>> SaveSessions([FromBody] SessionsDto sessionsDto)
        {
            List<Session> sessions = [];

            foreach(var session in sessionsDto.Sessions)
            {
                Classroom classroom = null;
                if (session.Classroom != null) {
                    classroom = await _context.Classrooms.FindAsync(session.Classroom.Id);
                    if (classroom == null) {
                        return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Classroom not found"});
                    }
                }
                List<Speaker> speakers = [];
                if (session.Speakers.Count > 0) {
                    var speakerIds = session.Speakers.Select(sp => sp.Id).ToList();
                    speakers = await _context.Speakers.Where(s => speakerIds.Contains(s.Id)).ToListAsync();
                    if (speakers == null) {
                        return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Speakers not found"});
                    }
                }

                var studentIds = session.Students.Select(st => st.Id).ToList();
                List<Student> students = await _context.Students.Where(s => studentIds.Contains(s.Id)).ToListAsync();
                //TODO if I create custom subject, I would need to handle that here.
                Career subject = await _context.Careers.FindAsync(session.Subject.Id);
                
                if (students == null) {
                    return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Students not found"});
                }
                if (subject == null) {
                    return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Subject not found"});
                }

                Session newSession = new()
                {
                    Classroom = classroom,
                    Students = students,
                    Speakers = speakers,
                    Period = session.Period,
                    Subject = subject,
                    EventId = session.EventId
                };
                sessions.Add(newSession);
            }

            _context.Sessions.AddRange(sessions);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(new { message = "Successfully Saved Sessions" });

            return BadRequest(new ProblemDetails { Title = "Problem creating sessions" });
        }

        [HttpPut]
        public async Task<ActionResult> UpdateSessions([FromBody] SessionsDto sessionsDto)
        {
            var sessions = await _context.Sessions
                .Where(s => sessionsDto.Sessions.Select(se => se.Id).ToList().Contains(s.Id))
                .Include(s => s.Classroom)
                .Include(s => s.Students)
                .Include(s => s.Speakers)
                .Include(s => s.Subject)
                .ToListAsync();

            if (sessions.Count != sessionsDto.Sessions.Count)
                return BadRequest(new ProblemDetails { Title = "Problem finding all sessions. "});

            foreach(var sessionDto in sessionsDto.Sessions)
            {
                var session = sessions.FirstOrDefault(s => s.Id == sessionDto.Id);
                if (session == null) continue;

                if (sessionDto.Classroom != null) {
                    var classroom = await _context.Classrooms.FindAsync(sessionDto.Classroom.Id);
                    if (classroom == null) {
                        return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Classroom not found"});
                    }
                    session.Classroom = classroom;
                }
                
                if (sessionDto.Speakers.Count > 0) {
                    var speakers = await _context.Speakers
                        .Where(s => sessionDto.Speakers.Select(sp => sp.Id).ToList().Contains(s.Id))
                        .ToListAsync();
                    session.Speakers = speakers;
                }

                List<Student> students = await _context.Students
                    .Where(s => sessionDto.Students.Select(st => st.Id).ToList().Contains(s.Id))
                    .ToListAsync();

                Career subject = await _context.Careers.FindAsync(sessionDto.Subject.Id);
                
                if (students == null) {
                    return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Students not found"});
                }
                if (subject == null) {
                    return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Subject not found"});
                }

                session.Students = students;
                session.Period = sessionDto.Period;
                session.Subject = subject;
                session.EventId = sessionDto.EventId;
            }

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(new { message = "Successfully Saved Sessions" });

            return BadRequest(new ProblemDetails { Title = "Problem creating sessions" });
        }

        [HttpDelete("{eventId}")]
        public async Task<ActionResult> DeleteSessions(int eventId)
        {
            var sessions = await _context.Sessions.Where(s => s.EventId == eventId).ToListAsync();

            _context.Sessions.RemoveRange(sessions);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting sessions for event: " + eventId });
        }

        [HttpGet("primary")]
        public async Task<ActionResult> ExportPrimary([FromQuery] ExportParams exportParams)
        {
            var careerEvent = await _context.Events.FindAsync(exportParams.EventId);
            
            var students = await _context.Students
                .Where(s => s.EventId == exportParams.EventId)
                .Include(s => s.Sessions).ThenInclude(s => s.Classroom)
                .Include(s => s.Sessions).ThenInclude(s => s.Speakers)
                .Include(s => s.Sessions).ThenInclude(s => s.Subject)
                .ToListAsync();

            var numOfSessions = students[0].Sessions.Count;

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
                headers.Add("Career " + i);
                headers.Add("Room " + i);
            }

            var rows = new List<object[]>();

            foreach(var student in students)
            {
                var sessions = student.Sessions.OrderBy(s => s.Period).ToList();
                var rowIndex = 6;

                var row = new object[rowIndex + sessions.Count * 2];
                row[0] = student.StudentNumber;
                row[1] = student.LastFirstName;
                row[2] = student.Gender;
                row[3] = student.Grade;
                row[4] = student.HomeroomTeacher;
                row[5] = student.HomeroomNumber;

                foreach(var session in sessions)
                {
                    row[rowIndex++] = session.Subject.Name;
                    if (session.Classroom != null)
                        row[rowIndex++] = session.Classroom.Building + session.Classroom.RoomNumber;
                    else
                        rowIndex++;
                }

                rows.Add(row);
            }

            string fileName = $"{careerEvent.Name}_{careerEvent.EventDate.ToString("MM-dd-yyyy")}_PrimarySchedule.xlsx";

            var stream = await _excelService.ExportToExcel(headers, rows, "Primary Schedule");

            Response.AddExcelHeader(fileName, _excelService.excelMimeType);

            return File(stream, _excelService.excelMimeType, fileName);
        }
    }

}