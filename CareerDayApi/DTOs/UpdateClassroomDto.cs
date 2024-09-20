using System.ComponentModel.DataAnnotations;
using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UpdateClassroomDto
    {
        public int Id { get; set; }

        [Required]
        public School School { get; set; }
        public string Building { get; set; }

        [Required]
        public string RoomNumber { get; set; }
        public int Capacity { get; set; }
        public int Overflow { get; set; }
    }
}