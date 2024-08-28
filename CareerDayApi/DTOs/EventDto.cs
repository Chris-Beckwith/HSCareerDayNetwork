using System.ComponentModel.DataAnnotations;
using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class EventDto
    {
        [Required]
        public School School { get; set; }

        [Required]
        public DateTime EventDate { get; set; }
        
        [Required]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }
        public int SurveyCompletePercent { get; set; }
        public EventPhase EventPhase { get; set; }
    }
}