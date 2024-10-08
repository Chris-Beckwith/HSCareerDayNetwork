using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class updatingToAlternateCareer : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SurveySecondaryCareers_Careers_SecondaryCareersId",
                table: "SurveySecondaryCareers");

            migrationBuilder.DropForeignKey(
                name: "FK_SurveySecondaryCareers_Surveys_Survey1Id",
                table: "SurveySecondaryCareers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SurveySecondaryCareers",
                table: "SurveySecondaryCareers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "b3d38977-67ab-44fa-934f-40e02918e24d");

            migrationBuilder.RenameTable(
                name: "SurveySecondaryCareers",
                newName: "SurveyAlternateCareers");

            migrationBuilder.RenameColumn(
                name: "SecondaryCareersId",
                table: "SurveyAlternateCareers",
                newName: "AlternateCareersId");

            migrationBuilder.RenameIndex(
                name: "IX_SurveySecondaryCareers_Survey1Id",
                table: "SurveyAlternateCareers",
                newName: "IX_SurveyAlternateCareers_Survey1Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SurveyAlternateCareers",
                table: "SurveyAlternateCareers",
                columns: new[] { "AlternateCareersId", "Survey1Id" });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "51c04c9f-10e0-4f81-bf6e-d55d82312346", null, "Admin", "ADMIN" });

            migrationBuilder.AddForeignKey(
                name: "FK_SurveyAlternateCareers_Careers_AlternateCareersId",
                table: "SurveyAlternateCareers",
                column: "AlternateCareersId",
                principalTable: "Careers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SurveyAlternateCareers_Surveys_Survey1Id",
                table: "SurveyAlternateCareers",
                column: "Survey1Id",
                principalTable: "Surveys",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SurveyAlternateCareers_Careers_AlternateCareersId",
                table: "SurveyAlternateCareers");

            migrationBuilder.DropForeignKey(
                name: "FK_SurveyAlternateCareers_Surveys_Survey1Id",
                table: "SurveyAlternateCareers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SurveyAlternateCareers",
                table: "SurveyAlternateCareers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "51c04c9f-10e0-4f81-bf6e-d55d82312346");

            migrationBuilder.RenameTable(
                name: "SurveyAlternateCareers",
                newName: "SurveySecondaryCareers");

            migrationBuilder.RenameColumn(
                name: "AlternateCareersId",
                table: "SurveySecondaryCareers",
                newName: "SecondaryCareersId");

            migrationBuilder.RenameIndex(
                name: "IX_SurveyAlternateCareers_Survey1Id",
                table: "SurveySecondaryCareers",
                newName: "IX_SurveySecondaryCareers_Survey1Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SurveySecondaryCareers",
                table: "SurveySecondaryCareers",
                columns: new[] { "SecondaryCareersId", "Survey1Id" });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "b3d38977-67ab-44fa-934f-40e02918e24d", null, "Admin", "ADMIN" });

            migrationBuilder.AddForeignKey(
                name: "FK_SurveySecondaryCareers_Careers_SecondaryCareersId",
                table: "SurveySecondaryCareers",
                column: "SecondaryCareersId",
                principalTable: "Careers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SurveySecondaryCareers_Surveys_Survey1Id",
                table: "SurveySecondaryCareers",
                column: "Survey1Id",
                principalTable: "Surveys",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
