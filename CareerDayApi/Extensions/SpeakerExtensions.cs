using CareerDayApi.Entities;

namespace CareerDayApi.Extensions
{
    public static class SpeakerExtensions
    {
        public static IQueryable<Speaker> Search(this IQueryable<Speaker> query, string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm)) return query;

            var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

            return query.Where(s => s.FirstName.ToLower().Contains(searchTerm) 
                || s.LastName.ToLower().Contains(searchTerm)
                || s.MiddleName.ToLower().Contains(searchTerm)
                || s.Title.ToLower().Contains(searchTerm)
                || s.Company.ToLower().Contains(searchTerm)
                || s.Email.ToLower().Contains(searchTerm)
                || s.PhoneNumber.ToLower().Contains(searchTerm));
        }
    }
}