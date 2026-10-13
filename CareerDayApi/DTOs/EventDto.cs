using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.DTOs
{
    public class EventDto
    {
        [Required]
        public int SchoolId { get; set; }

        [Required]
        public DateTime EventDate { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int SurveyCompletePercent { get; set; }
    }
}