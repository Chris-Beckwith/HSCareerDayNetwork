using System.Text.Json.Serialization;

namespace CareerDayApi.Entities
{
    //License Bound
    public class CareerSet
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<Career> Careers { get; set; } = [];
        public int? LicenseId { get; set; }

        [JsonIgnore]
        public License License { get; set; }
    }
}