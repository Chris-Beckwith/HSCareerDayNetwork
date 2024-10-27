using Microsoft.AspNetCore.Identity;

namespace CareerDayApi.Entities
{
    public class User : IdentityUser
    {
        public Event Event { get; set; }
        public int? EventId { get; set; }
    }
}