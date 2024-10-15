using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class GenerateScheduleParamsDto
    {
        public int EventId { get; set; }
        public int MaxClassSize { get; set; }
        public int MinClassSize { get; set; }
        public int PeriodCount { get; set; }
        public Dictionary<int, bool[]> RequiredPeriodForCareerList { get; set; }
        public Career[][] SameSpeakersForCareerList { get; set; }
    }
}