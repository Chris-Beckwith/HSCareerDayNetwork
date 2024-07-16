using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class SchoolDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public SchoolAddress Address { get; set; }
        public int EstimatedNumOfStudents { get; set; }
    }
}