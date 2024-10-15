using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.Entities
{
    public class Classroom
    {
        public int Id { get; set; }

        [Required]
        public School School { get; set; }
        public string Building { get; set; }

        [Required]
        public string RoomNumber { get; set; }
        public int Capacity { get; set; }
        public int Overflow { get; set; }
        public int SchoolId { get; set; }
    }
}