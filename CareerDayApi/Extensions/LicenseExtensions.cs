using CareerDayApi.Entities;

namespace CareerDayApi.Extensions
{
    public static class LicenseExtensions
    {
        public static IQueryable<License> Search(this IQueryable<License> query, string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm)) return query;

            var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

            return query.Where(l => l.Users.Any(u => u.Email == searchTerm));
        }
    }
}