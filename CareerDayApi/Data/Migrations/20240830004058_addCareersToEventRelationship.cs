using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addCareersToEventRelationship : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.CreateTable(
                name: "CareerEvent",
                columns: table => new
                {
                    CareersId = table.Column<int>(type: "integer", nullable: false),
                    EventId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CareerEvent", x => new { x.CareersId, x.EventId });
                    table.ForeignKey(
                        name: "FK_CareerEvent_Careers_CareersId",
                        column: x => x.CareersId,
                        principalTable: "Careers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CareerEvent_Events_EventId",
                        column: x => x.EventId,
                        principalTable: "Events",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "88752dd0-cf97-4fae-b59e-72b020479aa6", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_CareerEvent_EventId",
                table: "CareerEvent",
                column: "EventId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CareerEvent");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "88752dd0-cf97-4fae-b59e-72b020479aa6");

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
    }
}
