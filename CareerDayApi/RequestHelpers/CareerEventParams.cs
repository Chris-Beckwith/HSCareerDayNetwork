namespace CareerDayApi.RequestHelpers
{
    public class CareerEventParams : PaginationParams
    {
        public string OrderBy { get; set; }
        public string SearchTerm { get; set; }
        public string EventPhases { get; set; }
        public string SurveyCompletePercent { get; set; }
        public string IsDeleted { get; set; }
    }
}