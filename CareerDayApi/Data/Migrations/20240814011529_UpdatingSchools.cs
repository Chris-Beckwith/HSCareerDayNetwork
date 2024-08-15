using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class UpdatingSchools : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "c5edf336-70ec-4ff7-a04c-4d40e92e42f5");

            migrationBuilder.AddColumn<string>(
                name: "ContactEmail",
                table: "Schools",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ContactName",
                table: "Schools",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ContactPhone",
                table: "Schools",
                type: "text",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "76be05bb-a68c-4a0e-b4ee-fbbdac894e27", null, "Admin", "ADMIN" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "76be05bb-a68c-4a0e-b4ee-fbbdac894e27");

            migrationBuilder.DropColumn(
                name: "ContactEmail",
                table: "Schools");

            migrationBuilder.DropColumn(
                name: "ContactName",
                table: "Schools");

            migrationBuilder.DropColumn(
                name: "ContactPhone",
                table: "Schools");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "c5edf336-70ec-4ff7-a04c-4d40e92e42f5", null, "Admin", "ADMIN" });
        }
    }
}
