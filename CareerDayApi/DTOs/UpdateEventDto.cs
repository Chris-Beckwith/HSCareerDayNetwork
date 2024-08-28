using System.ComponentModel.DataAnnotations;
using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UpdateEventDto
    {
        public int Id { get; set; }

        [Required]
        public School School { get; set; }

        [Required]
        public DateTime EventDate { get; set; }
        
        [Required]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }
        public int SurveyCompletePercent { get; set; }

        [Required]
        public EventPhase EventPhase { get; set; }
        public List<int> SpeakerIds { get; set; }
        public List<int> CareerIds { get; set; }
    }
}