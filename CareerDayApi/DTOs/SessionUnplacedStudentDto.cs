using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class SessionUnplacedStudentDto
    {
        public StudentDto Student { get; set; }
        public Career Career { get; set; }
        public List<Career> AltCareers { get; set; }
        public int Period { get; set; }
    }
}