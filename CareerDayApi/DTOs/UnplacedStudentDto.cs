using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UnplacedStudentDto
    {
        public Student Student { get; set; }
        public Career Career { get; set; }
    }
}