
using CareerDayApi.Data;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class SchedulingController(CareerDayContext context,
        ILogger<SchedulingController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly ILogger<SchedulingController> _logger = logger;

        [HttpPost]
        public async Task<ActionResult<List<Session>>> GenerateSchedule([FromForm] GenerateScheduleParamsDto generateScheduleParamsDto)
        {
            var surveys = await _context.Surveys
                                        .Include(s => s.Student)
                                        .Include(s => s.PrimaryCareers)
                                        .Include(s => s.AlternateCareers)
                                        .Where(s => s.Student.EventId == generateScheduleParamsDto.EventId).ToListAsync();

            // var periodCount = generateScheduleParamsDto.PeriodCount;

            // Dictionary to count the number of times each primary career is selected
            var primaryCareerCounts = surveys
                .SelectMany(s => s.PrimaryCareers)
                .GroupBy(c => c)
                .ToDictionary(g => g.Key, g => g.Count());

            // Sort the surveys list based on primary career popularity, then gender, then grade
            var sortedSurveys = surveys
                .OrderBy(s => s.PrimaryCareers.Max(c => primaryCareerCounts.TryGetValue(c, out int value) ? value : 0))
                .ThenBy(s => s.Student.Gender)
                .ThenByDescending(s => s.Student.Grade)
                .ToList();
            
            var allSessions = new List<Session>();

            // Initialize Sessions
            foreach(var count in primaryCareerCounts)
            {
                for (var i = 0; i < Math.Ceiling((double)count.Value / generateScheduleParamsDto.MaxClassSize); i++)
                {
                    allSessions.Add(new Session {
                        Subject = count.Key,
                        EventId = generateScheduleParamsDto.EventId
                    });
                }
            }

            // Initialize Periods
            var periods = new List<List<Session>>();
            for (int i = 0; i < generateScheduleParamsDto.PeriodCount; i++)
            {
                var sessionList = new List<Session>();
                periods.Add(sessionList);
            }

            // Initialize Session population map
            var sessionPopulation = new Dictionary<Session, int>();
            foreach(var session in allSessions)
            {
                sessionPopulation[session] = 0;
            }

            List<Session> FindSessionsForCareerSorted(Career career)
            {
                return sessionPopulation
                    .Where(kvp => kvp.Key.Subject == career)
                    .OrderBy(kvp => kvp.Value)
                    .Select(kvp => kvp.Key)
                    .ToList();
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

                    // Find session for that career with least students
                    var sessions = FindSessionsForCareerSorted(pCareer);
                    foreach(Session session in sessions)
                    {
                        // If period already assigned, check if student already has session in that period
                        // Else, Find periods with least sessions and no session with current session's career subject
                        if (session.Period == 0) {
                            // Session not assigned period, find a period
                            var careerSubjectCounts = periods
                                .Select(period => period.Count(s => s.Subject == session.Subject))
                                .ToList();

                            // Determine the minimum count of sessions for the specified career subject
                            int minCount = careerSubjectCounts.Min();

                            // Return only those with the minimum count of sessions of that subject
                            var availablePeriods = periods
                                .Select((period, index) => new { Period = period, Index = index })
                                .Where(x => careerSubjectCounts[x.Index] == minCount)
                                .OrderBy(x => x.Period.Count)
                                .ToList();
                            
                            foreach(var availPeriod in availablePeriods)
                            {
                                int periodIndex = availPeriod.Index;
                                var periodSessions = availPeriod.Period;

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
                                Career = pCareer
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
                                .Where(session => session.Subject == enrolledSession.Subject)
                                .OrderBy(session => session.Students.Count)
                                .FirstOrDefault();

                            Session sessionToPlace = periods[enrolledSession.Period - 1]
                                .Where(session => session.Subject == unplacedCareer)
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
                                            .Where(session => session.Subject == otherEnrolledSession.Subject)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        Session enrolledToOtherEnrolled = periods[otherEnrolledSession.Period - 1]
                                            .Where(session => session.Subject == enrolledSession.Subject)
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
                                            .Where(session => session.Subject == unplacedCareer)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        Session otherEnrolledToEnrolled = periods[enrolledSession.Period - 1]
                                            .Where(session => session.Subject == otherEnrolledSession.Subject)
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
                                            .Where(session => session.Subject == otherEnrolledSession.Subject)
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        sessionToPlace = periods[otherEnrolledSession.Period - 1]
                                            .Where(session => session.Subject == unplacedCareer)
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

            // var one = periods[0].SelectMany(s => s.Students).Distinct().ToList();
            // var two = periods[1].SelectMany(s => s.Students).Distinct().ToList();
            // var tre = periods[2].SelectMany(s => s.Students).Distinct().ToList();

            var result = new ScheduleResultDto
            {
                AllSessions = allSessions,
                UnplacedStudents = unplacedStudents
            };

            return Ok(result);
        }

        [HttpGet("{eventId}")]
        public async Task<ActionResult<List<Session>>> GetSessions(int eventId)
        {
            var sessions = await _context.Sessions.Where(s => s.EventId == eventId)
                .Include(s => s.Classroom).ThenInclude(c => c.School)
                .Include(s => s.Students).ThenInclude(st => st.School)
                .Include(s => s.Speakers).ThenInclude(sp => sp.SchoolLastSpokeAt)
                .Include(s => s.Speakers).ThenInclude(sp => sp.Address)
                .Include(s => s.Speakers).ThenInclude(sp => sp.Careers)
                .Include(s => s.Subject)
                .ToListAsync();

            return sessions;
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

        [HttpDelete("{eventId}")]
        public async Task<ActionResult> DeleteSessions(int eventId)
        {
            var sessions = await _context.Sessions.Where(s => s.EventId == eventId).ToListAsync();

            _context.Sessions.RemoveRange(sessions);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting sessions for event: " + eventId });
        }
    }

}