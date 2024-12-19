using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class SessionDto
    {
        public int Id { get; set; }
        public Classroom Classroom { get; set; }
        public List<StudentDto> Students { get; set; } = [];
        public List<SpeakerDto> Speakers { get; set; } = [];
        public int Period { get; set; }
        public Career Subject { get; set; }
        public int EventId { get; set; }

    }
}