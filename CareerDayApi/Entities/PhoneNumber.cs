namespace CareerDayApi.Entities
{
    public class PhoneNumber
    {
        public int Id { get; set; }
        public string Number { get; set; }
        public string Ext { get; set; }
        public PhoneNumberType Type { get; set; } = PhoneNumberType.Mobile;
        public Boolean IsPrimary { get; set; }
        public int SpeakerId { get; set; }
    }

    public enum PhoneNumberType
    {
        Mobile = 0,
        Work = 1,
        Home = 2,
        Other = 3
    }
}