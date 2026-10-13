namespace CareerDayApi.Models
{
    public class LicenseInvitationEmailModel
    {
        public string RegistrationUrl { get; set; }
        public DateTime ExpirationDate { get; set; }
    }
}