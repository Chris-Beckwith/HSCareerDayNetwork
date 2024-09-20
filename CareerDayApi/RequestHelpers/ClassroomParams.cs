namespace CareerDayApi.RequestHelpers
{
    public class ClassroomParams : PaginationParams
    {
        public int SchoolId { get; set; }
        public string SearchTerm { get; set; }
    }
}