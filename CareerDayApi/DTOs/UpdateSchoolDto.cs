using System.ComponentModel.DataAnnotations;
using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UpdateSchoolDto
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
        
        [Required]
        public SchoolAddress Address { get; set; }
        public string ContactName { get; set; }
        public string ContactPhone { get; set; }
        public string ContactEmail { get; set; }
        public int EstimatedNumOfStudents { get; set; }
    }
}