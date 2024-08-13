using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class UpdatingCareer : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "4d05ef50-81ff-4344-bbbb-180c5b7ddc3f");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Careers",
                type: "text",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Category",
                table: "Careers",
                type: "text",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "CourseId",
                table: "Careers",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Note",
                table: "Careers",
                type: "text",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "5dd17b1c-86d0-4c63-9d71-8eea0bbd534c", null, "Admin", "ADMIN" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5dd17b1c-86d0-4c63-9d71-8eea0bbd534c");

            migrationBuilder.DropColumn(
                name: "Category",
                table: "Careers");

            migrationBuilder.DropColumn(
                name: "CourseId",
                table: "Careers");

            migrationBuilder.DropColumn(
                name: "Note",
                table: "Careers");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Careers",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "4d05ef50-81ff-4344-bbbb-180c5b7ddc3f", null, "Admin", "ADMIN" });
        }
    }
}
