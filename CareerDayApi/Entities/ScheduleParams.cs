using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json;

namespace CareerDayApi.Entities
{
    public class ScheduleParams
    {
        public int Id { get; set; }
        public int EventId { get; set; }
        public int MaxClassSize { get; set; }
        public int MinClassSize { get; set; }
        public int PeriodCount { get; set; }
        public string RequiredPeriodForCareerListJson { get; set; }
        public string SameSpeakersForCareerListJson { get; set; }

        [NotMapped]
        public Dictionary<int, int[]> RequiredPeriodForCareerList
        {
            get => string.IsNullOrEmpty(RequiredPeriodForCareerListJson)
                ? new Dictionary<int, int[]>()
                : JsonSerializer.Deserialize<Dictionary<int, int[]>>(RequiredPeriodForCareerListJson);
            set => RequiredPeriodForCareerListJson = JsonSerializer.Serialize(value);
        }

        [NotMapped]
        public Career[][] SameSpeakersForCareerList
        {
            get => string.IsNullOrEmpty(SameSpeakersForCareerListJson)
                ? Array.Empty<Career[]>()
                : JsonSerializer.Deserialize<Career[][]>(SameSpeakersForCareerListJson, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                });
            set => SameSpeakersForCareerListJson = JsonSerializer.Serialize(value);
        }
    }
}