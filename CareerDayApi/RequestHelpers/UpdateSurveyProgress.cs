using CareerDayApi.Data;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.RequestHelpers
{
    public class UpdateSurveyProgress
    {
        public static async Task<bool> UpdateSurveyProgressAsync(int eventId, CareerDayContext context)
        {
            var totalStudents = await context.Students.Where(s => s.EventId == eventId).CountAsync();
            var totalSubmissions = await context.Surveys.Where(s => s.Student.EventId == eventId).CountAsync();
            var updateEvent = await context.Events.FindAsync(eventId);

            if (updateEvent == null) return false;

            if (totalSubmissions == 0 || totalStudents == 0)
            {
                updateEvent.SurveyCompletePercent = 0;
            }
            else
            {
                updateEvent.SurveyCompletePercent =
                    (int)Math.Floor((double)totalSubmissions / totalStudents * 100);
            }

            var result = await context.SaveChangesAsync() > 0;

            return result;
        }
    }
}