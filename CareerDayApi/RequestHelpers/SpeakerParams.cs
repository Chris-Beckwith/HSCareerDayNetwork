using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CareerDayApi.RequestHelpers
{
    public class SpeakerParams : PaginationParams
    {
        public string SearchTerm { get; set; }
    }
}