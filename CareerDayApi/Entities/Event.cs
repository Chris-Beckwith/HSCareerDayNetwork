using System.ComponentModel.DataAnnotations;

namespace CareerDayApi.Entities
{
    public class Event
    {
        public int Id { get; set; }

        [Required]
        public School School { get; set; }

        [Required]
        public DateTime EventDate { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int SurveyCompletePercent { get; set; }

        [Required]
        public EventPhase EventPhase { get; set; }
        public List<Speaker> Speakers { get; set; } = [];
        public List<Career> Careers { get; set; } = [];
        public string GUID { get; set; }
        public string QRCodeUrl { get; set; }
        public string PublicId { get; set; }
        public bool IsDeleted { get; set; } = false;

        //TODO AddAllSpeakers, RemoveAllSpeakers

        public void AddSpeaker(Speaker speaker)
        {
            if (Speakers.All(newSpeaker => newSpeaker.Id != speaker.Id)) {
                Speakers.Add(speaker);
            }
        }

        public void RemoveSpeaker(int speakerId)
        {
            var speaker = Speakers.FirstOrDefault(speaker => speaker.Id == speakerId);
            if (speaker == null) return;
            Speakers.Remove(speaker);
        }
    }
}