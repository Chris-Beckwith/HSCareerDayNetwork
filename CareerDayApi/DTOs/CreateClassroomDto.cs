using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.DTOs
{
    public class CreateClassroomDto
    {
        [Required]
        public int SchoolId { get; set; }
        public string Building { get; set; }

        [Required]
        public string RoomNumber { get; set; }
        public int Capacity { get; set; }
        public int Overflow { get; set; }
    }
}