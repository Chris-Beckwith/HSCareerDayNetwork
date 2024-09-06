using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addingCareerSets3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Careers_CareerSets_CareerSetId",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_CareerSetId",
                table: "Careers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "ab33fc9f-aaad-45ae-96e0-0efab37bffaf");

            migrationBuilder.DropColumn(
                name: "CareerSetId",
                table: "Careers");

            migrationBuilder.CreateTable(
                name: "CareerCareerSet",
                columns: table => new
                {
                    CareerSetId = table.Column<int>(type: "integer", nullable: false),
                    CareersId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CareerCareerSet", x => new { x.CareerSetId, x.CareersId });
                    table.ForeignKey(
                        name: "FK_CareerCareerSet_CareerSets_CareerSetId",
                        column: x => x.CareerSetId,
                        principalTable: "CareerSets",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CareerCareerSet_Careers_CareersId",
                        column: x => x.CareersId,
                        principalTable: "Careers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "578b8a6c-c4ad-4f48-a94b-cf9a7367f89c", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_CareerCareerSet_CareersId",
                table: "CareerCareerSet",
                column: "CareersId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CareerCareerSet");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "578b8a6c-c4ad-4f48-a94b-cf9a7367f89c");

            migrationBuilder.AddColumn<int>(
                name: "CareerSetId",
                table: "Careers",
                type: "integer",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "ab33fc9f-aaad-45ae-96e0-0efab37bffaf", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Careers_CareerSetId",
                table: "Careers",
                column: "CareerSetId");

            migrationBuilder.AddForeignKey(
                name: "FK_Careers_CareerSets_CareerSetId",
                table: "Careers",
                column: "CareerSetId",
                principalTable: "CareerSets",
                principalColumn: "Id");
        }
    }
}
