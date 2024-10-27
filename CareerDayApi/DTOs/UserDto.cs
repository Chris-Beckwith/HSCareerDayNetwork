using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UserDto
    {
        public string Email { get; set; }
        public Event Event { get; set; }
        public string Token { get; set; }
    }
}