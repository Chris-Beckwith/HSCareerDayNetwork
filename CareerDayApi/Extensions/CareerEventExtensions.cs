using CareerDayApi.Entities;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Extensions
{
    public static class CareerEventExtensions
    {
        public static IQueryable<Event> Sort(this IQueryable<Event> query, string orderBy)
        {
            if (string.IsNullOrWhiteSpace(orderBy)) return query.OrderBy(e => e.Name);

            query = orderBy switch
            {
                "name" => query.OrderBy(e => e.Name),
                "date" => query.OrderBy(e => e.EventDate),
                "dateDesc" => query.OrderByDescending(e => e.EventDate),
                "surveyComplete" => query.OrderBy(e => e.SurveyCompletePercent),
                "surveyCompleteDesc" => query.OrderByDescending(e => e.SurveyCompletePercent),
                _ => query.OrderBy(e => e.EventDate)
            };

            return query;
        }

        public static IQueryable<Event> Search(this IQueryable<Event> query, string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm)) return query;

            var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

            return query.Where(e => e.Name.ToLower().Contains(lowerCaseSearchTerm));
        }

        public static IQueryable<Event> Filter(this IQueryable<Event> query, string eventPhases, string surveyCompletePercent, string isDeleted)
        {
            var eventPhaseList = new List<string>();

            if (!string.IsNullOrEmpty(eventPhases))
                eventPhaseList.AddRange(eventPhases.ToLower().Split(",").ToList());

            query = query
                .Where(e => eventPhaseList.Count == 0
                    || eventPhaseList.Contains(e.EventPhase.PhaseName.ToLower()));

            if (!string.IsNullOrEmpty(surveyCompletePercent))
            {
                query = query.Where(e => e.SurveyCompletePercent >= Int32.Parse(surveyCompletePercent));
            }

            if (string.IsNullOrEmpty(isDeleted) || !string.IsNullOrEmpty(isDeleted) && isDeleted == "0")
            {
                query = query.Where(e => e.IsDeleted == false);
            }

            return query;
        }

        public static IQueryable<Event> getEventDetails(this IQueryable<Event> query)
        {
            return query
                    .Include(p => p.EventPhase)
                    .Include(s => s.School).ThenInclude(a => a.Address)
                    .Include(s => s.Speakers).ThenInclude(c => c.Careers)
                    .Include(s => s.Speakers).ThenInclude(a => a.Address)
                    .Include(c => c.Careers);
        }
    }
}