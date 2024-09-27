
using CareerDayApi.Data;
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

        [HttpGet("{eventId}/{stdRoomSize}")]
        public async Task<ActionResult<List<Session>>> GenerateSchedule(int eventId, int stdRoomSize)
        {
            var surveys = await _context.Surveys
                                        .Include(s => s.Student)
                                        .Include(s => s.PrimaryCareers)
                                        .Include(s => s.SecondaryCareers)
                                        .Where(s => s.Student.EventId == eventId).ToListAsync();

            var periodCount = surveys.First().PrimaryCareers.Count;

            // First, create a dictionary to count the number of times each primary career is selected
            var primaryCareerCounts = surveys
                .SelectMany(s => s.PrimaryCareers)
                .GroupBy(c => c) // Group by career
                .ToDictionary(g => g.Key, g => g.Count()); // Create a dictionary: Career -> Count

            // Sort the surveys list based on primary career popularity, then gender, then grade
            var sortedSurveys = surveys
                .OrderBy(s => s.PrimaryCareers.Max(c => primaryCareerCounts.TryGetValue(c, out int value) ? value : 0)) // Sort by most selected primary career
                .ThenBy(s => s.Student.Gender) // Then by gender
                .ThenBy(s => s.Student.Grade) // Then by grade
                .ToList();
            
            var allSessions = new List<Session>();

            // Initialize Sessions
            foreach(var count in primaryCareerCounts)
            {
                for (var i = 0; i < Math.Ceiling((double)count.Value / stdRoomSize); i++)
                {
                    allSessions.Add(new Session {
                        Subject = count.Key
                    });
                }
            }

            // Initialize Periods
            var periods = new List<List<Session>>();
            for (int i = 0; i < periodCount; i++)
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
            var unplacedStudents = new List<Tuple<Student, Career>>();

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
                        unplacedStudents.Add(new Tuple<Student, Career>(survey.Student, pCareer));
                    }
                }
            }

            var placedStudents = new List<Tuple<Student, Career>>();

            foreach(Tuple<Student,Career> unplacedStudentCareer in unplacedStudents)
            {
                Student unplacedStudent = unplacedStudentCareer.Item1;
                Career unplacedCareer = unplacedStudentCareer.Item2;
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
                                            //SWAPPPPP
                                            // remove student from entrolledSession
                                            // add sessionToPlace to entrolledSession
                                            // remove student from otherEnrolledSession
                                            // add entrolledSession to otherEnrolledSession
                                            // add otherEnrolledSession to open
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

                                    // remove student from entrolledSession
                                    // add otherEnrolledSession to entrolledSession
                                    // remove student from otherEnrolledSession
                                    // add sessionToPlace to otherEnrolledSession
                                    // add enrolledSession to open
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

                                    //What if both are null??
                                    // enrolledSession can NOT go into open.period
                                    // sessionToPlace can NOT go into enrolledSession.period

                                    // Can sessionToPlace either go into otherEnrolledSession
                                    // Can otherEnrolledSession goes into open.period

                                    // This is same as initial check..
                                    // if (openSession == null && sessionToPlace == null) {
                                    //     openSession = periods[i]
                                    //         .Where(session => session.Subject == otherEnrolledSession.Subject)
                                    //         .OrderBy(session => session.Students.Count)
                                    //         .FirstOrDefault();

                                    //     sessionToPlace = periods[otherEnrolledSession.Period - 1]
                                    //         .Where(session => session.Subject == unplacedCareer)
                                    //         .OrderBy(session => session.Students.Count)
                                    //         .FirstOrDefault();
                                        
                                    //     if (openSession != null && sessionToPlace != null) {
                                    //     }
                                    // }
                                }
                            }
                        }
                    }
                    if (isAdded) break;
                }
            }

                
                // See if the session they are in in that period is available in a period they are not in
            //     for (int index = 0; index < periods.Count; index++)
            //     {
            //         if (enrolledPeriods.Contains(index)) {
            //             //Find session needed to place
            //             Session sessionToPlace = periods[index]
            //                 .Where(session => session.Subject == unplacedCareer)
            //                 .OrderBy(session => session.Students.Count)
            //                 .FirstOrDefault();

            //             //Find session currently enrolled
            //             Session enrolledSession = periods[index]
            //                 .Where(session => session.Students.Contains(unplacedStudent))
            //                 .FirstOrDefault();

            //             //See if enrolledSession can be placed in open period
            //             if (sessionToPlace != null && enrolledSession != null) {
            //                 for (int openIndex = 0; index < periods.Count; index++)
            //                 {
            //                     if (!enrolledPeriods.Contains(openIndex)) {
            //                         //Open Period
            //                         Session openSession = periods[openIndex]
            //                             .Where(session => session.Subject == enrolledSession.Subject)
            //                             .FirstOrDefault();

            //                         if (openSession != null) {
            //                             // Session found, make the swap
            //                             // Remove student from enrolled Session
            //                             enrolledSession.RemoveStudent(unplacedStudent.Id);
            //                             // Remove student from conflict map
            //                             conflictMap[enrolledSession.Period - 1].Remove(unplacedStudent);
            //                             // Decrement sessionPopulation
            //                             sessionPopulation[enrolledSession]--;

            //                             // Add student to openSession
            //                             openSession.AddStudent(unplacedStudent);
            //                             // Add student to conflict map
            //                             conflictMap[openSession.Period - 1].Add(unplacedStudent);
            //                             // Increment sessionPopulation
            //                             sessionPopulation[openSession]++;

            //                             // Add student to sessionToPlace
            //                             sessionToPlace.AddStudent(unplacedStudent);
            //                             // Add student to conflict map
            //                             conflictMap[sessionToPlace.Period - 1].Add(unplacedStudent);
            //                             // Increment sessionPopulation
            //                             sessionPopulation[sessionToPlace]++;

            //                             // Placed Student
            //                             placedStudents.Add(unplacedStudentCareer);
            //                             isAdded = true;
            //                             break;
            //                         }
            //                     }
            //                 }
            //             }
            //         }
            //         if (isAdded) break;
            //     }
            //         // Move them from the session they are in to the session in the period they are not in
            //         // Place unplaced student in now available session in that period
            // }

            foreach(var studentToRemove in placedStudents)
            {
                unplacedStudents.Remove(studentToRemove);
            }

            // Foreach conflict session
                // Get conflict students and sessions they conflict with
                // Try to find another session of same subject that does not conflict
                // If no other sessions that conflict, try moving other conflicting sessions
                // If not found, remove student from session, add to student/career conflict list, include which sessions they are currently in.

            return Ok(allSessions);
        }
    }
}