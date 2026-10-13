namespace CareerDayApi.DTOs
{
    public class UpdateStudentDto
    {
        public int Id { get; set; }
        public string StudentNumber { get; set; }
        public string LastFirstName { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Gender { get; set; }
        public int Grade { get; set; }
        public string Email { get; set; }
        public string HomeroomTeacher { get; set; }
        public string HomeroomNumber { get; set; }
        public bool SurveyComplete { get; set; }
    }
}