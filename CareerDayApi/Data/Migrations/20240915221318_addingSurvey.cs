using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addingSurvey : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "67f605f9-8cbf-4161-afb2-85962746bd7e");

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

            migrationBuilder.CreateTable(
                name: "Surveys",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    StudentId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Surveys", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Surveys_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "7567f1e1-5aca-47a4-ad98-a71385a97aec", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Careers_SurveyId",
                table: "Careers",
                column: "SurveyId");

            migrationBuilder.CreateIndex(
                name: "IX_Careers_SurveyId1",
                table: "Careers",
                column: "SurveyId1");

            migrationBuilder.CreateIndex(
                name: "IX_Surveys_StudentId",
                table: "Surveys",
                column: "StudentId",
                unique: true);

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Careers_Surveys_SurveyId",
                table: "Careers");

            migrationBuilder.DropForeignKey(
                name: "FK_Careers_Surveys_SurveyId1",
                table: "Careers");

            migrationBuilder.DropTable(
                name: "Surveys");

            migrationBuilder.DropIndex(
                name: "IX_Careers_SurveyId",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_SurveyId1",
                table: "Careers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "7567f1e1-5aca-47a4-ad98-a71385a97aec");

            migrationBuilder.DropColumn(
                name: "SurveyId",
                table: "Careers");

            migrationBuilder.DropColumn(
                name: "SurveyId1",
                table: "Careers");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "67f605f9-8cbf-4161-afb2-85962746bd7e", null, "Admin", "ADMIN" });
        }
    }
}
