namespace CareerDayApi.Entities
{
    public class Address
    {
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }

        public override string ToString()
        {
            var addressParts = new[] { Address1, Address2, City, State, Zip, Country }
                .Where(a => !string.IsNullOrWhiteSpace(a));
            return string.Join(", ", addressParts);
        }

        public string ToMultilineString()
        {
            var line1 = string.Join(", ", new[] { Address1, Address2 }
                .Where(a => !string.IsNullOrWhiteSpace(a)));
                
            var line2 = string.Join(", ", new[] { City, State, Zip, Country }
                .Where(a => !string.IsNullOrWhiteSpace(a)));

            return string.Join(Environment.NewLine, new[] { line1, line2 }
                .Where(line => !string.IsNullOrWhiteSpace(line)));

        }
    }
}