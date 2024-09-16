using System.ComponentModel.DataAnnotations.Schema;

namespace CareerDayApi.Entities
{
    public class Survey
    {
        public int Id { get; set; }

        [ForeignKey("StudentId")]
        public Student Student { get; set; }
        public List<Career> PrimaryCareers { get; set; } = [];
        public List<Career> SecondaryCareers { get; set; } = [];
        public int StudentId { get; set; }
    }
}