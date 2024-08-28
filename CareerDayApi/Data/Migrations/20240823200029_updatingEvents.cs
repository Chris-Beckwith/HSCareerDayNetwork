using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class updatingEvents : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "ae129b59-05ac-4063-87cb-a3e6903ba701");

            migrationBuilder.AddColumn<int>(
                name: "EventId",
                table: "Careers",
                type: "integer",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "54c66e12-f291-4a96-bf77-ad5d694a62d4", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Careers_EventId",
                table: "Careers",
                column: "EventId");

            migrationBuilder.AddForeignKey(
                name: "FK_Careers_Events_EventId",
                table: "Careers",
                column: "EventId",
                principalTable: "Events",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Careers_Events_EventId",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_EventId",
                table: "Careers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "54c66e12-f291-4a96-bf77-ad5d694a62d4");

            migrationBuilder.DropColumn(
                name: "EventId",
                table: "Careers");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "ae129b59-05ac-4063-87cb-a3e6903ba701", null, "Admin", "ADMIN" });
        }
    }
}
