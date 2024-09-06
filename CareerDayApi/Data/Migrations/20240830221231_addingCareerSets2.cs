using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addingCareerSets2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "92f3aeff-d34f-4bc9-aca1-ee504078fac9");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "ab33fc9f-aaad-45ae-96e0-0efab37bffaf", null, "Admin", "ADMIN" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "ab33fc9f-aaad-45ae-96e0-0efab37bffaf");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "92f3aeff-d34f-4bc9-aca1-ee504078fac9", null, "Admin", "ADMIN" });
        }
    }
}
