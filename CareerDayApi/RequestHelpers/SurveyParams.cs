namespace CareerDayApi.RequestHelpers
{
    public class SurveyParams
    {
        public int EventId { get; set; }
        public bool SortOption { get; set; }
        public bool ViewOption { get; set; }
        public bool IncludeAlternate { get; set; }
        public bool ShowAlternate { get; set; }
    }
}