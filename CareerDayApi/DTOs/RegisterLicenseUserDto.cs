namespace CareerDayApi.DTOs
{
    public class RegisterLicenseUserDto : LoginDto
    {
        public string InviteToken { get; set; }
    }
}