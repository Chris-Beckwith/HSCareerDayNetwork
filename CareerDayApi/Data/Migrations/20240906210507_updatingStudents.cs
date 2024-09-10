using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class updatingStudents : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "578b8a6c-c4ad-4f48-a94b-cf9a7367f89c");

            migrationBuilder.RenameColumn(
                name: "MiddleName",
                table: "Students",
                newName: "StudentNumber");

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Students",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "EventId",
                table: "Students",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Gender",
                table: "Students",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Grade",
                table: "Students",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "HomeroomNumber",
                table: "Students",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "HomeroomTeacher",
                table: "Students",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LastFirstName",
                table: "Students",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "SurveyComplete",
                table: "Students",
                type: "boolean",
                nullable: false,
                defaultValue: false);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "74020bc3-5726-4bef-9ffe-9774e6b31b00", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Students_EventId",
                table: "Students",
                column: "EventId");

            migrationBuilder.CreateIndex(
                name: "IX_Students_StudentNumber_EventId",
                table: "Students",
                columns: new[] { "StudentNumber", "EventId" },
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Events_EventId",
                table: "Students",
                column: "EventId",
                principalTable: "Events",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Students_Events_EventId",
                table: "Students");

            migrationBuilder.DropIndex(
                name: "IX_Students_EventId",
                table: "Students");

            migrationBuilder.DropIndex(
                name: "IX_Students_StudentNumber_EventId",
                table: "Students");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "74020bc3-5726-4bef-9ffe-9774e6b31b00");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "EventId",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "Gender",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "Grade",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "HomeroomNumber",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "HomeroomTeacher",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "LastFirstName",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "SurveyComplete",
                table: "Students");

            migrationBuilder.RenameColumn(
                name: "StudentNumber",
                table: "Students",
                newName: "MiddleName");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "578b8a6c-c4ad-4f48-a94b-cf9a7367f89c", null, "Admin", "ADMIN" });
        }
    }
}
