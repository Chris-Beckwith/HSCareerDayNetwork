using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Identity;

namespace CareerDayApi.Entities
{
    //License Bound
    public class User : IdentityUser
    {
        public Event Event { get; set; }
        public int? EventId { get; set; }
        
        [JsonIgnore]
        public License License { get; set; }
        public int? LicenseId { get; set; }
    }
}