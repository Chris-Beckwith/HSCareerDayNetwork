namespace CareerDayApi.Entities
{
    public class License
    {
        public int Id { get; set; }
        public LicenseType Type { get; set; } // Full, SurveyOnly
        public LicenseStatus Status { get; set; } // Active, Expired, Cancelled
        public DateTime StartDate { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public int? MaxSchools { get; set; }
        public int? MaxEvents { get; set; }
        public ICollection<User> Users { get; set; } = [];
        public ICollection<School> Schools { get; set; } = [];
        public ICollection<Event> Events { get; set; } = [];
        public ICollection<Career> Careers { get; set; } = [];
        public ICollection<CareerSet> CareerSets { get; set; } = [];
        public ICollection<Speaker> Speakers { get; set; } = [];
    }

    public enum LicenseType
    {
        Full,
        SurveyOnly
    }

    public enum LicenseStatus
    {
        Active,
        Expired,
        Cancelled
    }
}