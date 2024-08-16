using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class UpdatingCareers : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "76be05bb-a68c-4a0e-b4ee-fbbdac894e27");

            migrationBuilder.DropColumn(
                name: "Note",
                table: "Careers");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "e05810fd-c5c8-4c76-bbc8-2e89e9def423", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Careers_Category",
                table: "Careers",
                column: "Category",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Careers_CourseId",
                table: "Careers",
                column: "CourseId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Careers_Name",
                table: "Careers",
                column: "Name",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Careers_Category",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_CourseId",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_Name",
                table: "Careers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "e05810fd-c5c8-4c76-bbc8-2e89e9def423");

            migrationBuilder.AddColumn<string>(
                name: "Note",
                table: "Careers",
                type: "text",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "76be05bb-a68c-4a0e-b4ee-fbbdac894e27", null, "Admin", "ADMIN" });
        }
    }
}
