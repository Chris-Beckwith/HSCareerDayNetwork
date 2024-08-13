using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.DTOs
{
    public class EventDto
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }
        public int SurveyCompletePercent { get; set; }

        [Required]
        public int EventPhaseId { get; set; }
        public List<int> SpeakerIds { get; set; }

        [Required]
        public int SchoolId { get; set; }
        
        [Required]
        public DateTime EventDate { get; set; }
    }
}