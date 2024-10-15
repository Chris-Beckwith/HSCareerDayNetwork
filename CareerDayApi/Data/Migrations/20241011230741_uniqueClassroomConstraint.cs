using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class uniqueClassroomConstraint : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Classrooms_SchoolId",
                table: "Classrooms");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "51c04c9f-10e0-4f81-bf6e-d55d82312346");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "385d119d-ad88-433d-98d2-eaaa738cf9b0", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Classrooms_SchoolId_Building_RoomNumber",
                table: "Classrooms",
                columns: new[] { "SchoolId", "Building", "RoomNumber" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Classrooms_SchoolId_Building_RoomNumber",
                table: "Classrooms");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "385d119d-ad88-433d-98d2-eaaa738cf9b0");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "51c04c9f-10e0-4f81-bf6e-d55d82312346", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Classrooms_SchoolId",
                table: "Classrooms",
                column: "SchoolId");
        }
    }
}
