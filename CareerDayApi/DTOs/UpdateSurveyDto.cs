using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UpdateSurveyDto
    {
        public int Id { get; set; }
        public List<Career> PrimaryCareers { get; set; }
        public List<Career> AlternateCareers { get; set; }
    }
}