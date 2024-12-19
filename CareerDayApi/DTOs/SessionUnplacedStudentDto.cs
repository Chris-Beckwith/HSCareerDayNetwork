using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class SessionUnplacedStudentDto
    {
        public StudentDto Student { get; set; }
        public Career Career { get; set; }
    }
}