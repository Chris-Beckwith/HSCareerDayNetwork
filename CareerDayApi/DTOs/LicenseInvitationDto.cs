using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class LicenseInvitationDto
    {
        public string Email { get; set; } 
        public DateTime ExpirationDate { get; set; }
        public DateTime? UsedAt { get; set; }
        public License License { get; set; }
    }
}