using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class SessionResultDto
    {
        public List<SessionDto> AllSessions { get; set; }
        public List<SessionUnplacedStudentDto> UnplacedStudents { get; set; }
    }
}