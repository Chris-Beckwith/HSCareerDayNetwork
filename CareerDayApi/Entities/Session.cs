namespace CareerDayApi.Entities
{
    public class Session
    {
        public int Id { get; set; }
        public Classroom Classroom { get; set; }
        public Student[] Students { get; set; }
        public Speaker[] Speakers { get; set; }
        public int Period { get; set; }
        public Career Subject { get; set; }
    }
}