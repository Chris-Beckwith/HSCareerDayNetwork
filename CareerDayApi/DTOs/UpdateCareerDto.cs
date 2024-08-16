using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.DTOs
{
    public class UpdateCareerDto
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public int CourseId { get; set; }

        [Required]
        public string Category { get; set; }
        public string Description { get; set; }
    }
}