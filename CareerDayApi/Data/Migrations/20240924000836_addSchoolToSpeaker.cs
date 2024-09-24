using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addSchoolToSpeaker : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "679c23c4-2338-4c62-a090-1214e89023ce");

            migrationBuilder.AddColumn<int>(
                name: "SchoolLastSpokeAtId",
                table: "Speakers",
                type: "integer",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "05dd8b34-734e-4b3a-97bc-64f3b18042cb", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Speakers_SchoolLastSpokeAtId",
                table: "Speakers",
                column: "SchoolLastSpokeAtId");

            migrationBuilder.AddForeignKey(
                name: "FK_Speakers_Schools_SchoolLastSpokeAtId",
                table: "Speakers",
                column: "SchoolLastSpokeAtId",
                principalTable: "Schools",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Speakers_Schools_SchoolLastSpokeAtId",
                table: "Speakers");

            migrationBuilder.DropIndex(
                name: "IX_Speakers_SchoolLastSpokeAtId",
                table: "Speakers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "05dd8b34-734e-4b3a-97bc-64f3b18042cb");

            migrationBuilder.DropColumn(
                name: "SchoolLastSpokeAtId",
                table: "Speakers");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "679c23c4-2338-4c62-a090-1214e89023ce", null, "Admin", "ADMIN" });
        }
    }
}
