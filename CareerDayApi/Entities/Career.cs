using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.Entities
{
    public class Career
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public int CourseId { get; set; }

        [Required]
        public string Category { get; set; }
        public string Description { get; set; }
        public string Note { get; set; }
    }
}