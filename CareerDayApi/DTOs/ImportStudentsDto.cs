using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CareerDayApi.DTOs
{
    public class ImportStudentsDto
    {
        public IFormFile File { get; set; }
        public int EventId { get; set; }
    }
}