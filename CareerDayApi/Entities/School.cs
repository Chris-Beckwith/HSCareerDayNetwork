using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.Entities
{
    public class School
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
        
        [Required]
        public SchoolAddress Address { get; set; }
        public int EstimatedNumOfStudents { get; set; }
    }
}