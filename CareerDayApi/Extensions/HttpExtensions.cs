using System.Text.Json;
using CareerDayApi.RequestHelpers;

namespace CareerDayApi.Extensions
{
    public static class HttpExtensions
    {
        public static void AddPaginationHeader(this HttpResponse response, PaginationMetaData metaData)
        {
            var options = new JsonSerializerOptions{PropertyNamingPolicy = JsonNamingPolicy.CamelCase};
            
            response.Headers.Append("Pagination", JsonSerializer.Serialize(metaData, options));
            response.Headers.Append("Access-Control-Expose-Headers", "Pagination");
        }

        public static void AddExcelHeader(this HttpResponse response, string fileName, string mimeType)
        {
            response.Headers.Append("Content-Disposition", $"attachment; filename={fileName}");
            response.Headers.Append("Access-Control-Expose-Headers", "Content-Disposition");
            response.Headers.Append("Content-Type", mimeType);
        }
    }
}