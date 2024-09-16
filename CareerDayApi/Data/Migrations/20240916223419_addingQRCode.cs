using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addingQRCode : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "7a7866f9-c841-447c-a98c-1ea27aea7ffb");

            migrationBuilder.AddColumn<string>(
                name: "PublicId",
                table: "Events",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "QRCodeUrl",
                table: "Events",
                type: "text",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "da37dab3-d88c-4710-a646-a095bcc7f008", null, "Admin", "ADMIN" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "da37dab3-d88c-4710-a646-a095bcc7f008");

            migrationBuilder.DropColumn(
                name: "PublicId",
                table: "Events");

            migrationBuilder.DropColumn(
                name: "QRCodeUrl",
                table: "Events");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "7a7866f9-c841-447c-a98c-1ea27aea7ffb", null, "Admin", "ADMIN" });
        }
    }
}
