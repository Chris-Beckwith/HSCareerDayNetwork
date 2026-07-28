using CareerDayApi.Entities;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace CareerDayApi.Services
{
    public class ExcelService
    {
        public string excelMimeType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        public async Task<MemoryStream> ExportToExcel(List<string> headers, List<object[]> rows,
            string worksheetName, List<bool> centeredCols = null)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using var excelPackage = new ExcelPackage();
            var worksheet = excelPackage.Workbook.Worksheets.Add(worksheetName);

            // Freeze top row
            worksheet.View.FreezePanes(2, 1);

            // Add headers
            for (int col = 0; col < headers.Count; col++)
            {
                worksheet.Cells[1, col + 1].Value = headers[col];
                worksheet.Cells[1, col + 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                // worksheet.Cells[1, col + 1].Style.Border.BorderAround(ExcelBorderStyle.Thick);
            }

            // Add rows
            for (int rowIndex = 0; rowIndex < rows.Count; rowIndex++)
            {
                var row = rows[rowIndex];
                for (int colIndex = 0; colIndex < row.Length; colIndex++)
                {
                    worksheet.Cells[rowIndex + 2, colIndex + 1].Value = row[colIndex];
                    if (centeredCols != null && colIndex < centeredCols.Count && centeredCols[colIndex])
                    {
                        worksheet.Cells[rowIndex + 2, colIndex + 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    }
                    // worksheet.Cells[rowIndex + 2, colIndex + 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                }
            }

            worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns();

            var stream = new MemoryStream();
            await excelPackage.SaveAsAsync(stream);
            stream.Position = 0;

            return stream;
        }

        /**
         * Purpose: To export student schedules for the purpose of printing and cutting for handouts.
         * Options:
         *      Break Sessions
         *      Time periods
         *      Cut lines
         *      Grids
         *      One Sheet for: Grade or Homeroom or ??
         *      Landscape vs. Horizontal?
         *
         * Details: 
         *  Total Height of Landscape Letter page with 0.5" margins: 540 points, Half Height: 270 points
         *  Std Row height = 270 / 9
         *  (9) Rows = (1) One Double height title row + (2) info rows + (1) Header row + (3) Std Number of sessions 
         *                + (2) cutLine rows, split into two
         *  More than 3 sessions, then use min cut line gap 10 points
         *  Then half height is 260 and divide by 6 + number of sessions
         *  Note: Total height of 540 does not quite work, so I reduced the size of the cut lines to ensure fit.
         *
         *  Total Width doesn't work the same way, so just tested what worked for me.
         *
         *    [ s1 ] [ s2 ]
         *    [ s3 ] [ s4 ]
         */
        public async Task<MemoryStream> StudentScheduleToExcel(string title,
            List<Student> students, string worksheetName)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using var excelPackage = new ExcelPackage();
            var worksheet = excelPackage.Workbook.Worksheets.Add(worksheetName);

            //Printer Settings
            worksheet.PrinterSettings.Orientation = eOrientation.Landscape;
            worksheet.PrinterSettings.PaperSize = ePaperSize.Letter;
            worksheet.PrinterSettings.Scale = 100;
            worksheet.PrinterSettings.TopMargin = 0.5M;
            worksheet.PrinterSettings.BottomMargin = 0.5M;
            worksheet.PrinterSettings.LeftMargin = 0.5M;
            worksheet.PrinterSettings.RightMargin = 0.5M;
            worksheet.PrinterSettings.HorizontalCentered = true;

            // r = number of rows in schedule (std = 9). 1 title + 2 info + 1 header + # sessions + 2 cut line
            // n = number of schedules above
            // pushWidth = 8;  number of columns: 6 columns + 2 cut line
            var numOfSessions = students.Max(s => s.Sessions.Count);
            const int titleRows = 1;
            const int infoRows = 3;
            const int cutLineRows = 2;
            int r = titleRows + infoRows + numOfSessions + cutLineRows;
            int pushWidth = 8;
            int rowHeight = 30; // std row height
            int horizontalCutLineHeight = 13; // std cut line height (two rows)

            //Sort student list by: Teacher, HomeroomNumber, Grade, etc
            var sortedStudent = students.OrderBy(s => s.HomeroomTeacher).ToList();

            if (numOfSessions > 3)
            {
                rowHeight = titleRows + infoRows + numOfSessions / 260;
                horizontalCutLineHeight = 3;
            }

            worksheet.Cells.Style.Font.Size = 10;
            worksheet.Cells.Style.WrapText = true;
            worksheet.DefaultRowHeight = rowHeight;
            worksheet.DefaultColWidth = 12;
            worksheet.Columns[7,8].Width = 7;

            void RenderSchedule(Student s, int n, int push)
            {
                //Title
                var titleCell = worksheet.Cells[1+n*r, 1+push, 1+n*r, 6+push];
                titleCell.Merge = true;
                worksheet.Row(1+n*r).Height = rowHeight*2;
                titleCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                titleCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                if (title.Length > 70)
                {
                    titleCell.Style.Font.Size = 16;
                } else
                {
                    titleCell.Style.Font.Size = 18;
                }
                titleCell.Style.Font.Bold = true;
                titleCell.Value = title;

                //ID
                var idCell = worksheet.Cells[2+n*r, 1+push];
                idCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                idCell.Value = "ID# " + s.Id;
                //Name
                var nameCell = worksheet.Cells[2+n*r, 2+push, 2+n*r, 6+push];
                nameCell.Merge = true;
                nameCell.Value = s.LastFirstName;

                //Grade
                var gradeCell = worksheet.Cells[3+n*r, 1+push];
                gradeCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                gradeCell.Value = "Grade: " + s.Grade;
                //Teacher
                var homeCell = worksheet.Cells[3+n*r, 2+push, 3+n*r, 6+push];
                homeCell.Merge = true;
                if (s.HomeroomNumber != null)
                {
                    homeCell.Value = s.HomeroomNumber + " - " + s.HomeroomTeacher;
                }
                else
                {
                    homeCell.Value = s.HomeroomTeacher;
                }

                //Session
                var sessionHeaderCell = worksheet.Cells[4+n*r, 1+push];
                sessionHeaderCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sessionHeaderCell.Style.Font.Bold = true;
                sessionHeaderCell.Value = "Session";
                //Room
                var roomHeaderCell = worksheet.Cells[4+n*r, 2+push];
                roomHeaderCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                roomHeaderCell.Style.Font.Bold = true;
                roomHeaderCell.Value = "Room";
                //Career
                var careerHeaderCell = worksheet.Cells[4+n*r, 3+push, 4+n*r, 6+push];
                careerHeaderCell.Merge = true;
                careerHeaderCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                careerHeaderCell.Style.Font.Bold = true;
                careerHeaderCell.Value = "Career";

                var sessions = s.Sessions.OrderBy(session => session.Period).ToList();

                for(int i = 0; i < sessions.Count; i++)
                {
                    var periodCell = worksheet.Cells[5+i+n*r, 1+push];
                    periodCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    periodCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    periodCell.Value = sessions[i].Period;

                    var roomCell = worksheet.Cells[5+i+n*r, 2+push];
                    roomCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    roomCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    roomCell.Value = sessions[i].Classroom?.RoomNumber;

                    var subjectCell = worksheet.Cells[5+i+n*r, 3+push, 5+i+n*r, 6+push];
                    subjectCell.Merge = true;
                    subjectCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    subjectCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    subjectCell.Value = sessions[i].Subject.Name;
                }

                worksheet.Rows[5+n*r+numOfSessions, 5+n*r+numOfSessions+1].Height = horizontalCutLineHeight;
            }

            //n, Number of schedules above current schedule
            var n = 0;
            var push = 0;
            for(int i = 0; i < sortedStudent.Count; i++)
            {
                if (i != 0)
                {
                    if (i % 2 == 0)
                    {
                        n++;
                        push = 0;
                    }
                    else
                    {
                        push = pushWidth;
                    }
                }
                Student s = sortedStudent[i];
                RenderSchedule(s, n, push);

                if ((n+1) % 2 == 0)
                {
                    worksheet.Row((n+1)*r).PageBreak = true;
                }
                // else
                // {
                //     var vertCutLineOne = worksheet.Cells[5+n*r+numOfSessions, 1, 5+n*r+numOfSessions, 6+push];
                //     vertCutLineOne.Style.Border.Bottom.Style = ExcelBorderStyle.MediumDashed;
                // }
            }

            var stream = new MemoryStream();
            await excelPackage.SaveAsAsync(stream);
            stream.Position = 0;

            return stream;
        }

        public async Task<MemoryStream> SpeakerScheduleToExcel(string title,
            List<Speaker> speakers, string worksheetName)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using var excelPackage = new ExcelPackage();
            var worksheet = excelPackage.Workbook.Worksheets.Add(worksheetName);

            //Printer Settings
            worksheet.PrinterSettings.Orientation = eOrientation.Landscape;
            worksheet.PrinterSettings.PaperSize = ePaperSize.Letter;
            worksheet.PrinterSettings.Scale = 100;
            worksheet.PrinterSettings.TopMargin = 0.5M;
            worksheet.PrinterSettings.BottomMargin = 0.5M;
            worksheet.PrinterSettings.LeftMargin = 0.5M;
            worksheet.PrinterSettings.RightMargin = 0.5M;
            worksheet.PrinterSettings.HorizontalCentered = true;

            // Event Title
            // Speaker Name
            // Headers
            // List of Sessions, Rooms, Teacher, Subject, number of students enrolled.
            var numOfSessions = speakers.Max(s => s.Sessions.Count);

            // Probably need to recalculate and/or adjust the width/height
            int rowHeight = 30;
            int pushWidth = 8;
            int horizontalCutLineHeight = 13;
            // r = number of rows in a schedule (std = 8). 1 title + 1 speaker name + 1 header + # sessions + 2 cut line
            const int titleRows = 1;
            const int infoRows = 2; // Name and headers
            const int cutLineRows = 2;
            int r = titleRows + infoRows + numOfSessions + cutLineRows;

            worksheet.Cells.Style.Font.Size = 10;
            worksheet.Cells.Style.WrapText = true;
            worksheet.DefaultRowHeight = rowHeight;
            worksheet.DefaultColWidth = 12;
            worksheet.Columns[7,8].Width = 7;

            void RenderSchedule(Speaker s, int n, int push)
            {
                //Title
                var titleCell = worksheet.Cells[1+n*r, 1+push, 1+n*r, 6+push];
                titleCell.Merge = true;
                worksheet.Row(1+n*r).Height = rowHeight*2;
                titleCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                titleCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                if (title.Length > 70)
                {
                    titleCell.Style.Font.Size = 16;
                } else
                {
                    titleCell.Style.Font.Size = 18;
                }
                titleCell.Style.Font.Bold = true;
                titleCell.Value = title;

                //Name
                var nameCell = worksheet.Cells[2+n*r, 1+push, 2+n*r, 6+push];
                nameCell.Merge = true;
                nameCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                nameCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                nameCell.Value = "Schedule For: " + s.FirstName + " " + s.LastName;

                //Headers
                //Session
                var sessionHeaderCell = worksheet.Cells[3+n*r, 1+push];
                sessionHeaderCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sessionHeaderCell.Style.Font.Bold = true;
                sessionHeaderCell.Value = "Session";
                //Room
                var roomHeaderCell = worksheet.Cells[3+n*r, 2+push];
                roomHeaderCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                roomHeaderCell.Style.Font.Bold = true;
                roomHeaderCell.Value = "Room";
                //Enrolled
                var enrolledHeaderCell = worksheet.Cells[3+n*r, 3+push];
                enrolledHeaderCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                enrolledHeaderCell.Style.Font.Bold = true;
                enrolledHeaderCell.Value = "Enrld";
                //Subject
                var careerHeaderCell = worksheet.Cells[3+n*r, 4+push, 3+n*r, 6+push];
                careerHeaderCell.Merge = true;
                careerHeaderCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                careerHeaderCell.Style.Font.Bold = true;
                careerHeaderCell.Value = "Subject";

                var sessions = s.Sessions.OrderBy(session => session.Period).ToList();

                for(int i = 0; i < sessions.Count; i++)
                {
                    var periodCell = worksheet.Cells[4+i+n*r, 1+push];
                    periodCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    periodCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    periodCell.Value = sessions[i].Period;

                    var roomCell = worksheet.Cells[4+i+n*r, 2+push];
                    roomCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    roomCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    roomCell.Value = sessions[i].Classroom?.RoomNumber;

                    var enrolledCell = worksheet.Cells[4+i+n*r, 3+push];
                    enrolledCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    enrolledCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    enrolledCell.Value = sessions[i].Students.Count;

                    var subjectCell = worksheet.Cells[4+i+n*r, 4+push, 4+i+n*r, 6+push];
                    subjectCell.Merge = true;
                    subjectCell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    subjectCell.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    subjectCell.Value = sessions[i].Subject.Name;
                }

                worksheet.Rows[4+n*r+numOfSessions, 4+n*r+numOfSessions+1].Height = horizontalCutLineHeight;
            }

            //n, number of schedules above current schedule
            //push, left or right schedule
            var n = 0;
            var push = 0;
            for(int i = 0; i < speakers.Count; i++)
            {
                if (i != 0)
                {
                    //New line
                    if (i % 2 == 0)
                    {
                        n++;
                        push = 0;
                    }
                    //Right Schedule
                    else
                    {
                        push = pushWidth;
                    }
                }
                Speaker s = speakers[i];
                RenderSchedule(s, n, push);

                if ((n+1) % 2 == 0)
                {
                    worksheet.Row((n+1)*r).PageBreak = true;
                }
                // else
                // {
                //     var vertCutLineOne = worksheet.Cells[5+n*r+numOfSessions, 1, 5+n*r+numOfSessions, 6+push];
                //     vertCutLineOne.Style.Border.Bottom.Style = ExcelBorderStyle.MediumDashed;
                // }
            }

            var stream = new MemoryStream();
            await excelPackage.SaveAsAsync(stream);
            stream.Position = 0;

            return stream;
        }
    }
}