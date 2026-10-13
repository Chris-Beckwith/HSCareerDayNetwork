
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
    public class SchedulingController(CareerDayContext context, IMapper mapper,
        UserManager<User> userManager, ILogger<SchedulingController> logger) : BaseApiController
    {
        private readonly CareerDayContext _context = context;
        private readonly IMapper _mapper = mapper;
        private readonly UserManager<User> _userManager = userManager;
        private readonly ILogger<SchedulingController> _logger = logger;

        [HttpPost]
        public async Task<ActionResult<List<Session>>> GenerateSchedule([FromForm] GenerateScheduleParamsDto generateScheduleParamsDto)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var selectedEvent = await _context.Events
                .FirstOrDefaultAsync(e => e.Id == generateScheduleParamsDto.EventId && e.LicenseId == currentUser.LicenseId);
            if (selectedEvent == null) return NotFound();

            var surveys = await _context.Surveys
                .Include(s => s.Student)
                .Include(s => s.PrimaryCareers)
                .Include(s => s.AlternateCareers)
                .Where(s => s.Student.EventId == selectedEvent.Id)
                .ToListAsync();

            var maxClassSize = generateScheduleParamsDto.MaxClassSize;
            var minClassSize = generateScheduleParamsDto.MinClassSize;

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

            int GetMaxClassSize(int careerId)
            {
                return generateScheduleParamsDto.CareerMaxClassSizeList != null 
                    && generateScheduleParamsDto.CareerMaxClassSizeList.TryGetValue(careerId, out int careerMaxClasSize)
                        ? careerMaxClasSize
                        : maxClassSize;
            }

            List<Session> FindSessionsForCareerSorted(Career career)
            {
                return sessionPopulation
                    .Where(kvp => kvp.Key.Subject.Id == career.Id && kvp.Value < GetMaxClassSize(career.Id))
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
                                Career = actualPCareer,
                                AltCareers = survey.AlternateCareers
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
                                .Where(session => session.Subject.Id == enrolledSession.Subject.Id 
                                    && session.Students.Count < GetMaxClassSize(enrolledSession.Subject.Id))
                                .OrderBy(session => session.Students.Count)
                                .FirstOrDefault();

                            Session sessionToPlace = periods[enrolledSession.Period - 1]
                                .Where(session => session.Subject.Id == unplacedCareer.Id 
                                    && session.Students.Count < GetMaxClassSize(unplacedCareer.Id))
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
                                            .Where(session => session.Subject.Id == otherEnrolledSession.Subject.Id 
                                                && session.Students.Count < GetMaxClassSize(otherEnrolledSession.Subject.Id))
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        Session enrolledToOtherEnrolled = periods[otherEnrolledSession.Period - 1]
                                            .Where(session => session.Subject.Id == enrolledSession.Subject.Id 
                                                && session.Students.Count < GetMaxClassSize(enrolledSession.Subject.Id))
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
                                            .Where(session => session.Subject.Id == unplacedCareer.Id 
                                                && session.Students.Count < GetMaxClassSize(unplacedCareer.Id))
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        Session otherEnrolledToEnrolled = periods[enrolledSession.Period - 1]
                                            .Where(session => session.Subject.Id == otherEnrolledSession.Subject.Id 
                                                && session.Students.Count < GetMaxClassSize(otherEnrolledSession.Subject.Id))
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
                                            .Where(session => session.Subject.Id == otherEnrolledSession.Subject.Id 
                                                && session.Students.Count < GetMaxClassSize(otherEnrolledSession.Subject.Id))
                                            .OrderBy(session => session.Students.Count)
                                            .FirstOrDefault();

                                        sessionToPlace = periods[otherEnrolledSession.Period - 1]
                                            .Where(session => session.Subject.Id == unplacedCareer.Id 
                                                && session.Students.Count < GetMaxClassSize(unplacedCareer.Id))
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

            //Under populated sessions
            var underPopulatedSessions = allSessions
                .Where(s => s.Students.Count < minClassSize)
                .ToList();

            foreach (var upSession in underPopulatedSessions)
            {
                // First, try other sessions of same subject in SAME period
                var samePeriodSessions = allSessions
                    .Where(s => s.Subject == upSession.Subject 
                                && s.Period == upSession.Period
                                && s.Id != upSession.Id
                                && s.Students.Count > minClassSize)
                    .ToList();

                foreach (var samePeriodSession in samePeriodSessions)
                {
                    foreach (var student in samePeriodSession.Students.ToList())
                    {
                        if (upSession.Students.Count >= minClassSize) break;

                        if (samePeriodSession.Students.Count > minClassSize &&
                            upSession.Students.Count < GetMaxClassSize(upSession.Subject.Id))
                        {
                            // Remove student from session
                            samePeriodSession.Students.Remove(student);
                            // Remove student from conflict map
                            conflictMap[samePeriodSession.Period - 1].Remove(student);
                            // Decrement sessionPopulation
                            sessionPopulation[samePeriodSession]--;

                            // Add student to Session
                            upSession.Students.Add(student);
                            // Add student to conflict map
                            conflictMap[upSession.Period - 1].Add(student);
                            // Increment sessionPopulation
                            sessionPopulation[upSession]++;
                        }
                    }
                }

                // If still under min, try CROSS-PERIOD swap
                if (upSession.Students.Count < minClassSize)
                {
                    var otherPeriodSessions = allSessions
                        .Where(s => s.Subject == upSession.Subject
                                    && s.Period != upSession.Period
                                    && s.Students.Count > minClassSize)
                        .ToList();

                    foreach (var oSession in otherPeriodSessions)
                    {
                        foreach (var student in oSession.Students.ToList())
                        {
                            if (upSession.Students.Count >= minClassSize) break;

                            // Look for student that has a class in upSession’s period
                            var conflictingSession = allSessions.FirstOrDefault(s =>
                                s.Period == upSession.Period &&
                                s.Students.Contains(student));

                            if (conflictingSession != null &&
                                conflictingSession.Subject != upSession.Subject &&
                                conflictingSession.Students.Count > minClassSize)
                            {
                                // Is there a matching subject in oSession’s period
                                var swapTarget = allSessions.FirstOrDefault(s =>
                                    s.Subject == conflictingSession.Subject &&
                                    s.Period == oSession.Period &&
                                    s.Students.Count < GetMaxClassSize(s.Subject.Id));

                                if (swapTarget != null)
                                {
                                    // Perform the swap
                                    conflictingSession.Students.Remove(student);
                                    conflictMap[conflictingSession.Period - 1].Remove(student);
                                    sessionPopulation[conflictingSession]--;

                                    swapTarget.Students.Add(student);
                                    conflictMap[swapTarget.Period - 1].Add(student);
                                    sessionPopulation[swapTarget]++;

                                    oSession.Students.Remove(student);
                                    conflictMap[oSession.Period - 1].Remove(student);
                                    sessionPopulation[oSession]--;

                                    upSession.Students.Add(student);
                                    conflictMap[upSession.Period - 1].Add(student);
                                    sessionPopulation[upSession]++;
                                }
                            }
                        }
                    }
                }
            }

            foreach(var session in allSessions)
            {
                if (session.Period == 0)
                {
                    var leastSessionsIndex = periods
                        .Select((period, index) => new { period, index })
                        .OrderBy(x => x.period.Count)
                        .First()
                        .index;
                    session.Period = leastSessionsIndex + 1;
                }
            }
            
            var result = new ScheduleResultDto
            {
                AllSessions = allSessions,
                UnplacedStudents = unplacedStudents
            };

            return Ok(result);
        }

        private static void AddRestrictedSession(GenerateScheduleParamsDto generateScheduleParamsDto, KeyValuePair<Career, int> count,
            List<Session> allSessions, List<List<Session>> periods)
        {
            // If totalSession > periodCount
                // Add session to each period
                
            // If allowed periods > totalSessions, partially restricted ("OR" restriction)
                // add without period
            // If allowed periods < totalSessions
                // allowed periods % totalSessions, split evenly add
                // else add all but extra (1 or 2)
            // If allowed periods = totalSessions, add

            var restrictPeriods = generateScheduleParamsDto.RequiredPeriodForCareerList[count.Key.Id];
            
            int maxClassSize;
            //Check for specific max class size
            if (generateScheduleParamsDto.CareerMaxClassSizeList != null
                && generateScheduleParamsDto.CareerMaxClassSizeList.TryGetValue(count.Key.Id, out int maxSize))
            {
                maxClassSize = maxSize;
            }
            else
            {
                maxClassSize = generateScheduleParamsDto.MaxClassSize;
            }
            //TODO if a career has requested additional sessions, add here (from generateScheduleParamsDto)
            var totalSessions = Math.Ceiling((double)count.Value / maxClassSize);

            // If totalSession > PeriodCount add one to each period until less than.
            // Add toggle for this TODO ***************
            while (totalSessions > generateScheduleParamsDto.PeriodCount)
            {
                for (var periodIndex = 0; periodIndex < generateScheduleParamsDto.PeriodCount; periodIndex++)
                {
                    var newSession = new Session
                    {
                        Subject = count.Key,
                        EventId = generateScheduleParamsDto.EventId,
                        Period = periodIndex + 1
                    };

                    periods[periodIndex].Add(newSession);
                    allSessions.Add(newSession);
                    totalSessions--;
                }
            }

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
                // Evenly allowed periods and number of sessions, place one session in each allowed period
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
            var currentUser = await _userManager.GetUserAsync(User);
            var selectedEvent = await _context.Events
                .FirstOrDefaultAsync(e => e.Id == eventId && e.LicenseId == currentUser.LicenseId);
            if (selectedEvent == null) return NotFound();

            var sessions = await _context.Sessions
                .Where(s => s.EventId == selectedEvent.Id)
                .Include(s => s.Classroom).ThenInclude(c => c.School)
                .Include(s => s.Students).ThenInclude(st => st.School)
                .Include(s => s.Speakers).ThenInclude(sp => sp.SchoolLastSpokeAt)
                .Include(s => s.Speakers).ThenInclude(sp => sp.Address)
                .Include(s => s.Speakers).ThenInclude(sp => sp.Careers)
                .Include(s => s.Subject)
                .ToListAsync();

            var unplacedStudents = new List<SessionUnplacedStudentDto>();

            var students = await _context.Students.Where(s => s.EventId == selectedEvent.Id)
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
                .Where(s => s.Student.EventId == selectedEvent.Id).ToListAsync();

            foreach (var student in students)
            {
                var survey = surveys.FirstOrDefault(s => s.Student.Id == student.Id);
                if (survey == null || survey.PrimaryCareers == null || survey.PrimaryCareers.Count == 0)
                    continue;

                var primaryCareers = survey.PrimaryCareers;

                var sessionSubjects = student.Sessions.Select(s => s.Subject).ToList();

                var missingCareers = primaryCareers.Where(pc => !sessionSubjects.Contains(pc)).ToList();

                var periods = Enumerable.Range(1, primaryCareers.Count);
                var missingPeriods = periods.Except([.. student.Sessions.Select(s => s.Period)]).ToList();
                var i = 0;

                foreach(var career in missingCareers)
                {
                    if (i < missingPeriods.Count) {
                        unplacedStudents.Add(new SessionUnplacedStudentDto
                        {
                            Student = _mapper.Map(student, new StudentDto()),
                            Career = career,
                            AltCareers = survey.AlternateCareers,
                            Period = missingPeriods[i++]
                        });
                    }
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

        /**
        * Save sessions after they are generated,
        * not saving classrooms or speakers since they are added afterwards.
        */
        [HttpPost("save")]
        public async Task<ActionResult<List<Session>>> SaveSessions([FromBody] SessionsDto sessionsDto)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var careerEvent = await _context.Events
                .Include(e => e.Careers)
                .Include(e => e.School)
                .Include(e => e.Speakers)
                .FirstOrDefaultAsync(e => e.Id == sessionsDto.EventId && e.LicenseId == currentUser.LicenseId);
            if (careerEvent == null) return NotFound();

            var currentLicenseId = User.IsInRole("Admin") ? null : currentUser.LicenseId;

            List<Session> sessions = [];
            var careerIds = careerEvent.Careers.Select(c => c.Id).ToList();

            foreach(var sessionDto in sessionsDto.Sessions)
            {
                //TODO if I create custom subject, I would need to handle that here.
                Career subject = await _context.Careers
                    .FirstOrDefaultAsync(c => c.Id == sessionDto.Subject.Id
                        && careerIds.Contains(c.Id)
                        && c.LicenseId == currentLicenseId);

                if (subject == null)
                    return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Subject not found"});
                
                var studentIds = sessionDto.Students.Select(st => st.Id).ToList();
                List<Student> students = await _context.Students
                    .Where(s => studentIds.Contains(s.Id) && s.EventId == careerEvent.Id)
                    .ToListAsync();
                
                if (students.Count != sessionDto.Students.Count)
                    return BadRequest(new ProblemDetails { Title = "Problem creating sessions: Students not found"});

                Session newSession = new()
                {
                    Students = students,
                    Period = sessionDto.Period,
                    Subject = subject,
                    EventId = careerEvent.Id
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
            var currentUser = await _userManager.GetUserAsync(User);
            var careerEvent = await _context.Events
                .Include(e => e.Careers)
                .Include(e => e.School)
                .Include(e => e.Speakers)
                .FirstOrDefaultAsync(e => e.Id == sessionsDto.EventId && e.LicenseId == currentUser.LicenseId);
            if (careerEvent == null) return NotFound();

            var sessionIds = sessionsDto.Sessions.Select(s => s.Id).ToList();

            var sessions = await _context.Sessions
                .Where(s => sessionIds.Contains(s.Id) && s.EventId == careerEvent.Id)
                .Include(s => s.Subject)
                .Include(s => s.Classroom)
                .Include(s => s.Speakers)
                .Include(s => s.Students)
                .ToListAsync();

            if (sessions.Count != sessionsDto.Sessions.Count)
                return BadRequest(new ProblemDetails { Title = "Problem finding all sessions. "});

            var eventCareerIds = careerEvent.Careers.Select(c => c.Id).ToList();
            var eventSpeakerIds = careerEvent.Speakers.Select(s => s.Id).ToList();

            foreach(var sessionDto in sessionsDto.Sessions)
            {
                var session = sessions.FirstOrDefault(s => s.Id == sessionDto.Id);
                if (session == null) continue;

                if (sessionDto.Subject == null)
                    return BadRequest(new ProblemDetails { Title = "Session subject not set" });

                Career subject = await _context.Careers
                    .FirstOrDefaultAsync(c => c.Id == sessionDto.Subject.Id
                        && eventCareerIds.Contains(c.Id)
                        && c.LicenseId == currentUser.LicenseId);
                        
                if (subject == null)
                    return BadRequest(new ProblemDetails { Title = "Problem updating sessions: Subject not found"});

                if (sessionDto.Classroom != null) {
                    var classroom = await _context.Classrooms
                        .FirstOrDefaultAsync(c => c.Id  == sessionDto.Classroom.Id
                            && c.SchoolId == careerEvent.School.Id);

                    if (classroom == null)
                        return BadRequest(new ProblemDetails { Title = "Problem updating sessions: Classroom not found"});

                    session.Classroom = classroom;
                }
                else
                {
                    session.Classroom = null;
                }
                
                var speakers = await _context.Speakers
                    .Where(s => sessionDto.Speakers.Select(sp => sp.Id).Contains(s.Id)
                        && eventSpeakerIds.Contains(s.Id)
                        && s.LicenseId == currentUser.LicenseId)
                    .ToListAsync();

                if (speakers.Count != sessionDto.Speakers.Count)
                    return BadRequest(new ProblemDetails { Title = "Problem updating sessions: Not all speakers not found"});

                List<Student> students = await _context.Students
                    .Where(s => sessionDto.Students.Select(st => st.Id).Contains(s.Id)
                        && s.EventId == careerEvent.Id)
                    .ToListAsync();
                
                if (students.Count != sessionDto.Students.Count)
                    return BadRequest(new ProblemDetails { Title = "Problem updating sessions: Not all students not found"});

                session.Subject = subject;
                session.Speakers = speakers;
                session.Students = students;
                session.Period = sessionDto.Period;
            }

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok(new { message = "Successfully Saved Sessions" });

            return BadRequest(new ProblemDetails { Title = "Problem updating sessions" });
        }

        [HttpDelete("{eventId}")]
        public async Task<ActionResult> DeleteSessions(int eventId)
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var selectedEvent = await _context.Events
                .FirstOrDefaultAsync(e => e.Id == eventId && e.LicenseId == currentUser.LicenseId);
            if (selectedEvent == null) return NotFound();

            var sessions = await _context.Sessions.Where(s => s.EventId == eventId).ToListAsync();

            _context.Sessions.RemoveRange(sessions);

            var result = await _context.SaveChangesAsync() > 0;

            if (result) return Ok();

            return BadRequest(new ProblemDetails { Title = "Problem deleting sessions for event: " + eventId });
        }
    }

}