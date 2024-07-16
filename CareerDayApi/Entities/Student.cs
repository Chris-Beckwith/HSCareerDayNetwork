namespace CareerDayApi.Entities
{
    public class Student
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public School School { get; set; }
        // public int grade { get; set; }
        // public Address Address { get; set; }
    }
}