using CareerDayApi.Entities;

namespace CareerDayApi.Extensions
{
    public static class SchoolUserExtensions
    {
        public static IQueryable<User> Search(this IQueryable<User> query, string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm)) return query;

            var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

            return query.Where(s => s.Email.ToLower().Contains(lowerCaseSearchTerm)
                || s.UserName.ToLower().Contains(lowerCaseSearchTerm)
            );
        }
    }
}