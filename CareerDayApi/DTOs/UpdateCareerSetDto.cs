using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UpdateCareerSetDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Career[] Careers { get; set; }
    }
}