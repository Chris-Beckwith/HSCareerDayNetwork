using CareerDayApi.Entities;

namespace CareerDayApi.Extensions
{
    public static class SpeakerExtensions
    {
        public static IQueryable<Speaker> Search(this IQueryable<Speaker> query, string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm)) return query;

            var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

            return query.Where(s => s.FirstName.ToLower().Contains(lowerCaseSearchTerm) 
                || s.LastName.ToLower().Contains(lowerCaseSearchTerm)
                || s.MiddleName.ToLower().Contains(lowerCaseSearchTerm)
                || s.Title.ToLower().Contains(lowerCaseSearchTerm)
                || s.Company.ToLower().Contains(lowerCaseSearchTerm)
                || s.Email.ToLower().Contains(lowerCaseSearchTerm)
                || s.PhoneNumber.ToLower().Contains(lowerCaseSearchTerm));
        }
    }
}