using Microsoft.AspNetCore.Mvc;
using OfficeOpenXml;

namespace CareerDayApi.Services
{
    public class ExcelService
    {
        public string excelMimeType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        public async Task<MemoryStream> ExportToExcel(
            List<string> headers, List<object[]> rows, string worksheetName)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using var excelPackage = new ExcelPackage();
            var worksheet = excelPackage.Workbook.Worksheets.Add(worksheetName);

            // Add headers
            for (int col = 0; col < headers.Count; col++)
            {
                worksheet.Cells[1, col + 1].Value = headers[col];
            }

            // Add rows
            for (int rowIndex = 0; rowIndex < rows.Count; rowIndex++)
            {
                var row = rows[rowIndex];
                for (int colIndex = 0; colIndex < row.Length; colIndex++)
                {
                    worksheet.Cells[rowIndex + 2, colIndex + 1].Value = row[colIndex];
                }
            }

            worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns();

            var stream = new MemoryStream();
            await excelPackage.SaveAsAsync(stream);
            stream.Position = 0;

            return stream;
        }
    }
}