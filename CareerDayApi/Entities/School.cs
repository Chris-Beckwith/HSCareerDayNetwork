using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.Entities
{
    //License Bound
    public class School
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
        public int? LicenseId { get; set; }
        public License License { get; set; }
    }
}