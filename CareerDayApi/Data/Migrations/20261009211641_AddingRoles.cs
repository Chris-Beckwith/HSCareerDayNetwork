using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddingRoles : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Name",
                table: "Licenses");

            migrationBuilder.CreateTable(
                name: "LicenseInvitations",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    LicenseId = table.Column<int>(type: "integer", nullable: false),
                    Email = table.Column<string>(type: "text", nullable: true),
                    TokenHash = table.Column<string>(type: "text", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    ExpirationDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UsedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LicenseInvitations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_LicenseInvitations_Licenses_LicenseId",
                        column: x => x.LicenseId,
                        principalTable: "Licenses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "2afe299e-84ba-4abb-bb60-cee87e35ceab", null, "FullLicenseUser", "FULLLICENSEUSER" },
                    { "2c4f6fc3-fa99-4d40-a2da-84e76e30f303", null, "SurveyLicenseUser", "SURVEYLICENSEUSER" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_LicenseInvitations_LicenseId",
                table: "LicenseInvitations",
                column: "LicenseId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "LicenseInvitations");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "2afe299e-84ba-4abb-bb60-cee87e35ceab");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "2c4f6fc3-fa99-4d40-a2da-84e76e30f303");

            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "Licenses",
                type: "text",
                nullable: true);
        }
    }
}
