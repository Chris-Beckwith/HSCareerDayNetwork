namespace CareerDayApi.Entities
{
    public class CareerSet
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<Career> Careers { get; set; }
    }
}