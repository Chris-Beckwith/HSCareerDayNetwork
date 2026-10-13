namespace CareerDayApi.Entities
{
    public class LicenseInvitation
    {
        public int Id { get; set; }
        public int LicenseId { get; set; }
        public License License { get; set; }
        public string Email { get; set; }
        public string TokenHash { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ExpirationDate { get; set; }
        public DateTime? UsedAt { get; set; }
    }
}