using CareerDayApi.Entities;

namespace CareerDayApi.Extensions
{
    public static class ClassroomExtensions
    {
        public static IQueryable<Classroom> Search(this IQueryable<Classroom> query, string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm)) return query;

            var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

            return query.Where(s => s.Building.ToLower().Contains(lowerCaseSearchTerm)
                || s.RoomNumber.ToLower().Contains(lowerCaseSearchTerm)
            );
        }
    }
}