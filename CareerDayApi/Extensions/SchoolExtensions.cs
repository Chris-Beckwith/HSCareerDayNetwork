using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CareerDayApi.Entities;

namespace CareerDayApi.Extensions
{
    public static class SchoolExtensions
    {
        public static IQueryable<School> Search(this IQueryable<School> query, string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm)) return query;

            var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

            return query.Where(s => s.Name.ToLower().Contains(lowerCaseSearchTerm)
                || s.ContactEmail.ToLower().Contains(lowerCaseSearchTerm)
                || s.ContactName.ToLower().Contains(lowerCaseSearchTerm)
                || s.ContactPhone.ToLower().Contains(lowerCaseSearchTerm)
                || s.Address.Address1.ToLower().Contains(lowerCaseSearchTerm)
                || s.Address.Address2.ToLower().Contains(lowerCaseSearchTerm)
                || s.Address.City.ToLower().Contains(lowerCaseSearchTerm)
                || s.Address.State.ToLower().Contains(lowerCaseSearchTerm)
                || s.Address.Zip.ToLower().Contains(lowerCaseSearchTerm)
            );
        }
    }
}