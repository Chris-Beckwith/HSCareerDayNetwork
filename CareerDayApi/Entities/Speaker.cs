namespace CareerDayApi.Entities
{
    public class Speaker
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Title { get; set; }
        public string Company { get; set; }
        public string PortraitUrl { get; set; }
        public School SchoolLastSpokeAt { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public SpeakerAddress Address { get; set; }
        public List<Career> Careers { get; set; }
        public string PublicId { get; set; }
    }
}