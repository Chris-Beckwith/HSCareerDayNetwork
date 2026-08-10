namespace CareerDayApi.RequestHelpers
{
    public class SpeakerExportParams
    {
        public string SearchTerm { get; set; }
        public int? EventId { get; set; }
        public Boolean IncludeLastSchool { get; set; }
        public Boolean IncludePortrait { get; set; }
        public Boolean IncludeSubjects { get; set; }
        public Boolean IncludeAddress { get; set; }
    }
}