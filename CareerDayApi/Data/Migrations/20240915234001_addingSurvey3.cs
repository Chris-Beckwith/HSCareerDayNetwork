using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addingSurvey3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Careers_Surveys_SurveyId",
                table: "Careers");

            migrationBuilder.DropForeignKey(
                name: "FK_Careers_Surveys_SurveyId1",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_SurveyId",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_SurveyId1",
                table: "Careers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "be18399b-eb9d-4885-b426-e48f5fcc0e7a");

            migrationBuilder.DropColumn(
                name: "SurveyId",
                table: "Careers");

            migrationBuilder.DropColumn(
                name: "SurveyId1",
                table: "Careers");

            migrationBuilder.CreateTable(
                name: "SurveyPrimaryCareers",
                columns: table => new
                {
                    PrimaryCareersId = table.Column<int>(type: "integer", nullable: false),
                    SurveyId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SurveyPrimaryCareers", x => new { x.PrimaryCareersId, x.SurveyId });
                    table.ForeignKey(
                        name: "FK_SurveyPrimaryCareers_Careers_PrimaryCareersId",
                        column: x => x.PrimaryCareersId,
                        principalTable: "Careers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SurveyPrimaryCareers_Surveys_SurveyId",
                        column: x => x.SurveyId,
                        principalTable: "Surveys",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SurveySecondaryCareers",
                columns: table => new
                {
                    SecondaryCareersId = table.Column<int>(type: "integer", nullable: false),
                    Survey1Id = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SurveySecondaryCareers", x => new { x.SecondaryCareersId, x.Survey1Id });
                    table.ForeignKey(
                        name: "FK_SurveySecondaryCareers_Careers_SecondaryCareersId",
                        column: x => x.SecondaryCareersId,
                        principalTable: "Careers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SurveySecondaryCareers_Surveys_Survey1Id",
                        column: x => x.Survey1Id,
                        principalTable: "Surveys",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "32c692b4-97b0-446c-93c9-3d2ce1c7920d", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_SurveyPrimaryCareers_SurveyId",
                table: "SurveyPrimaryCareers",
                column: "SurveyId");

            migrationBuilder.CreateIndex(
                name: "IX_SurveySecondaryCareers_Survey1Id",
                table: "SurveySecondaryCareers",
                column: "Survey1Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SurveyPrimaryCareers");

            migrationBuilder.DropTable(
                name: "SurveySecondaryCareers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "32c692b4-97b0-446c-93c9-3d2ce1c7920d");

            migrationBuilder.AddColumn<int>(
                name: "SurveyId",
                table: "Careers",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SurveyId1",
                table: "Careers",
                type: "integer",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "be18399b-eb9d-4885-b426-e48f5fcc0e7a", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Careers_SurveyId",
                table: "Careers",
                column: "SurveyId");

            migrationBuilder.CreateIndex(
                name: "IX_Careers_SurveyId1",
                table: "Careers",
                column: "SurveyId1");

            migrationBuilder.AddForeignKey(
                name: "FK_Careers_Surveys_SurveyId",
                table: "Careers",
                column: "SurveyId",
                principalTable: "Surveys",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Careers_Surveys_SurveyId1",
                table: "Careers",
                column: "SurveyId1",
                principalTable: "Surveys",
                principalColumn: "Id");
        }
    }
}
