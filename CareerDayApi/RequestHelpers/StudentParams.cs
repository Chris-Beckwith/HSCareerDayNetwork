namespace CareerDayApi.RequestHelpers
{
    public class StudentParams : PaginationParams
    {
        public string SearchTerm { get; set; }
        public string Gender { get; set; }
        public string Grades { get; set; }
        public string SurveyComplete { get; set; }
        public int EventId { get; set; }
    }
}