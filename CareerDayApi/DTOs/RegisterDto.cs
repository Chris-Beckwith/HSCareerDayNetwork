using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class RegisterDto : LoginDto
    {
        public string Email { get; set; }
        public int EventId { get; set; }
    }
}