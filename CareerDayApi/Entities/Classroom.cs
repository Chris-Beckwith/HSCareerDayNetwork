namespace CareerDayApi.Entities
{
    public class Classroom
    {
        public int Id { get; set; }
        public School School { get; set; }
        public string RoomNumber { get; set; }
        public string Building { get; set; }
        public int Capacity { get; set; }
        public int Overflow { get; set; }
    }
}