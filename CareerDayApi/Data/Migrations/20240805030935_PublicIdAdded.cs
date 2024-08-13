using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class PublicIdAdded : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1a6047fa-3385-4002-8e9b-6e456cd1ec1b");

            migrationBuilder.AddColumn<string>(
                name: "PublicId",
                table: "Speakers",
                type: "text",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "4d05ef50-81ff-4344-bbbb-180c5b7ddc3f", null, "Admin", "ADMIN" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "4d05ef50-81ff-4344-bbbb-180c5b7ddc3f");

            migrationBuilder.DropColumn(
                name: "PublicId",
                table: "Speakers");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "1a6047fa-3385-4002-8e9b-6e456cd1ec1b", null, "Admin", "ADMIN" });
        }
    }
}
