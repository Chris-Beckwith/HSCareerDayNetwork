using System.ComponentModel.DataAnnotations;
using CareerDayApi.Entities;

namespace CareerDayApi.DTOs
{
    public class UpdateSpeakerDto
    {
        public int Id { get; set; }

        [Required]
        public string FirstName { get; set; }
        public string MiddleName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Company { get; set; }
        public School SchoolLastSpokeAt { get; set; }
        public IFormFile File { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public SpeakerAddress Address { get; set; }
        public List<int> CareerIds { get; set; }
    }
}