using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addingCareerSets : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "88752dd0-cf97-4fae-b59e-72b020479aa6");

            migrationBuilder.AddColumn<int>(
                name: "CareerSetId",
                table: "Careers",
                type: "integer",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "CareerSets",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Name = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CareerSets", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "92f3aeff-d34f-4bc9-aca1-ee504078fac9", null, "Admin", "ADMIN" });

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Careers_CareerSets_CareerSetId",
                table: "Careers");

            migrationBuilder.DropTable(
                name: "CareerSets");

            migrationBuilder.DropIndex(
                name: "IX_Careers_CareerSetId",
                table: "Careers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "92f3aeff-d34f-4bc9-aca1-ee504078fac9");

            migrationBuilder.DropColumn(
                name: "CareerSetId",
                table: "Careers");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "88752dd0-cf97-4fae-b59e-72b020479aa6", null, "Admin", "ADMIN" });
        }
    }
}
