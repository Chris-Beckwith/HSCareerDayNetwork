using CareerDayApi.Entities;

namespace CareerDayApi.Extensions
{
    public static class StudentExtensions
    {
        public static IQueryable<Student> Search(this IQueryable<Student> query, string searchTerm)
        {
            query = query.OrderBy(s => s.LastFirstName);

            if (string.IsNullOrEmpty(searchTerm)) return query;

            var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

            return query.Where(s => s.StudentNumber.ToLower().Contains(lowerCaseSearchTerm)
                || s.LastFirstName.ToLower().Contains(lowerCaseSearchTerm)
                || s.LastName.ToLower().Contains(lowerCaseSearchTerm)
                || s.FirstName.ToLower().Contains(lowerCaseSearchTerm)
                || s.Email.ToLower().Contains(lowerCaseSearchTerm)
                || s.HomeroomTeacher.ToLower().Contains(lowerCaseSearchTerm)
                || s.HomeroomNumber.ToLower().Contains(lowerCaseSearchTerm)
            );
        }

        public static IQueryable<Student> Filter(this IQueryable<Student> query,
            string gender, string grades, string surveyComplete, int eventId)
        {
            if (eventId > 0) {
                query = query.Where(s => s.Event.Id == eventId);
            }

            if  (!string.IsNullOrEmpty(gender)) {
                query = query.Where(s => s.Gender == gender);
            }

            var gradeList = new List<int>();
            if (!string.IsNullOrEmpty(grades)) {
                gradeList.AddRange(grades.ToLower().Split(",").Select(int.Parse).ToList());
            }
            
            query = query
                .Where(s => gradeList.Count == 0
                    || gradeList.Contains(s.Grade));

            if (!string.IsNullOrEmpty(surveyComplete)) {
                if (surveyComplete == "0")
                    query = query.Where(s => s.SurveyComplete == false);
                else if (surveyComplete == "1")
                    query = query.Where(s => s.SurveyComplete == true);
            }

            return query;
        }
    }
}