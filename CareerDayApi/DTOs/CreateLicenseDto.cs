using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class CreateLicenseDto
    {
        public LicenseType Type { get; set; }
        public string Email { get; set; }
        public int? MaxSchools { get; set; }
        public int? MaxEvents { get; set; }
        public DateOnly? ExpirationDate { get; set; }
    }
}