namespace CareerDayApi.DTOs
{
    public class ImportStudentsDto
    {
        public IFormFile File { get; set; }
        public int EventId { get; set; }
    }
}