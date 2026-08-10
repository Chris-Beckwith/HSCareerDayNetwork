using CareerDayApi.Entities;
using Microsoft.EntityFrameworkCore;

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
                || s.PhoneNumbers.Any(p => 
                    (p.Number.ToLower() + " x" + (p.Ext ?? "").ToLower()).Contains(lowerCaseSearchTerm))
                );
        }

        public static IQueryable<Speaker> GetSpeakerDetails(this IQueryable<Speaker> query)
        {
            return query
                    .Include(s => s.Address)
                    .Include(s => s.Careers)
                    .Include(s => s.PhoneNumbers)
                    .Include(s => s.SchoolLastSpokeAt);
        }
    }
}