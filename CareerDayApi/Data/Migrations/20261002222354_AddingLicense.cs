using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddingLicense : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Schools_Name",
                table: "Schools");

            migrationBuilder.DropIndex(
                name: "IX_CareerSets_Name",
                table: "CareerSets");

            migrationBuilder.DropIndex(
                name: "IX_Careers_CourseId",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_Name",
                table: "Careers");

            migrationBuilder.AddColumn<int>(
                name: "LicenseId",
                table: "Speakers",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LicenseId",
                table: "Schools",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LicenseId",
                table: "Events",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LicenseId",
                table: "CareerSets",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LicenseId",
                table: "Careers",
                type: "integer",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "UserName",
                table: "AspNetUsers",
                type: "character varying(50)",
                maxLength: 50,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "character varying(256)",
                oldMaxLength: 256,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "AspNetUsers",
                type: "character varying(254)",
                maxLength: 254,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "character varying(256)",
                oldMaxLength: 256,
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LicenseId",
                table: "AspNetUsers",
                type: "integer",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Licenses",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Name = table.Column<string>(type: "text", nullable: true),
                    Type = table.Column<int>(type: "integer", nullable: false),
                    Status = table.Column<int>(type: "integer", nullable: false),
                    StartDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    ExpirationDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    MaxSchools = table.Column<int>(type: "integer", nullable: true),
                    MaxEvents = table.Column<int>(type: "integer", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Licenses", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Speakers_LicenseId",
                table: "Speakers",
                column: "LicenseId");

            migrationBuilder.CreateIndex(
                name: "IX_Schools_LicenseId_Name",
                table: "Schools",
                columns: new[] { "LicenseId", "Name" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Schools_Name",
                table: "Schools",
                column: "Name",
                unique: true,
                filter: "\"LicenseId\" IS NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Events_LicenseId",
                table: "Events",
                column: "LicenseId");

            migrationBuilder.CreateIndex(
                name: "IX_CareerSets_LicenseId_Name",
                table: "CareerSets",
                columns: new[] { "LicenseId", "Name" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_CareerSets_Name",
                table: "CareerSets",
                column: "Name",
                unique: true,
                filter: "\"LicenseId\" IS NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Careers_LicenseId_Name",
                table: "Careers",
                columns: new[] { "LicenseId", "Name" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Careers_Name",
                table: "Careers",
                column: "Name",
                unique: true,
                filter: "\"LicenseId\" IS NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_LicenseId",
                table: "AspNetUsers",
                column: "LicenseId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Licenses_LicenseId",
                table: "AspNetUsers",
                column: "LicenseId",
                principalTable: "Licenses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Careers_Licenses_LicenseId",
                table: "Careers",
                column: "LicenseId",
                principalTable: "Licenses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_CareerSets_Licenses_LicenseId",
                table: "CareerSets",
                column: "LicenseId",
                principalTable: "Licenses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Events_Licenses_LicenseId",
                table: "Events",
                column: "LicenseId",
                principalTable: "Licenses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Schools_Licenses_LicenseId",
                table: "Schools",
                column: "LicenseId",
                principalTable: "Licenses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Speakers_Licenses_LicenseId",
                table: "Speakers",
                column: "LicenseId",
                principalTable: "Licenses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Licenses_LicenseId",
                table: "AspNetUsers");

            migrationBuilder.DropForeignKey(
                name: "FK_Careers_Licenses_LicenseId",
                table: "Careers");

            migrationBuilder.DropForeignKey(
                name: "FK_CareerSets_Licenses_LicenseId",
                table: "CareerSets");

            migrationBuilder.DropForeignKey(
                name: "FK_Events_Licenses_LicenseId",
                table: "Events");

            migrationBuilder.DropForeignKey(
                name: "FK_Schools_Licenses_LicenseId",
                table: "Schools");

            migrationBuilder.DropForeignKey(
                name: "FK_Speakers_Licenses_LicenseId",
                table: "Speakers");

            migrationBuilder.DropTable(
                name: "Licenses");

            migrationBuilder.DropIndex(
                name: "IX_Speakers_LicenseId",
                table: "Speakers");

            migrationBuilder.DropIndex(
                name: "IX_Schools_LicenseId_Name",
                table: "Schools");

            migrationBuilder.DropIndex(
                name: "IX_Schools_Name",
                table: "Schools");

            migrationBuilder.DropIndex(
                name: "IX_Events_LicenseId",
                table: "Events");

            migrationBuilder.DropIndex(
                name: "IX_CareerSets_LicenseId_Name",
                table: "CareerSets");

            migrationBuilder.DropIndex(
                name: "IX_CareerSets_Name",
                table: "CareerSets");

            migrationBuilder.DropIndex(
                name: "IX_Careers_LicenseId_Name",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_Careers_Name",
                table: "Careers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_LicenseId",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "LicenseId",
                table: "Speakers");

            migrationBuilder.DropColumn(
                name: "LicenseId",
                table: "Schools");

            migrationBuilder.DropColumn(
                name: "LicenseId",
                table: "Events");

            migrationBuilder.DropColumn(
                name: "LicenseId",
                table: "CareerSets");

            migrationBuilder.DropColumn(
                name: "LicenseId",
                table: "Careers");

            migrationBuilder.DropColumn(
                name: "LicenseId",
                table: "AspNetUsers");

            migrationBuilder.AlterColumn<string>(
                name: "UserName",
                table: "AspNetUsers",
                type: "character varying(256)",
                maxLength: 256,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "character varying(50)",
                oldMaxLength: 50,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "AspNetUsers",
                type: "character varying(256)",
                maxLength: 256,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "character varying(254)",
                oldMaxLength: 254,
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Schools_Name",
                table: "Schools",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_CareerSets_Name",
                table: "CareerSets",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Careers_CourseId",
                table: "Careers",
                column: "CourseId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Careers_Name",
                table: "Careers",
                column: "Name",
                unique: true);
        }
    }
}
