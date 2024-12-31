using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class ScheduleResultDto
    {
        public List<Session> AllSessions { get; set; }
        public List<int> PeriodCounts { get; set; }
        public List<UnplacedStudentDto> UnplacedStudents { get; set; }
    }
}