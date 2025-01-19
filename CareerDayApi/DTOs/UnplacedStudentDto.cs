using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UnplacedStudentDto
    {
        public Student Student { get; set; }
        public Career Career { get; set; }
        public List<Career> AltCareers { get; set; }
        public int Period { get; set; }
    }
}