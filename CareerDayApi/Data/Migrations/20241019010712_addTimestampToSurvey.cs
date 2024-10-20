using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class addTimestampToSurvey : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "385d119d-ad88-433d-98d2-eaaa738cf9b0");

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "Surveys",
                type: "timestamp with time zone",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "c8e20e08-b482-4cc8-abe8-22e9cd8bfb0b", null, "Admin", "ADMIN" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "c8e20e08-b482-4cc8-abe8-22e9cd8bfb0b");

            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "Surveys");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "385d119d-ad88-433d-98d2-eaaa738cf9b0", null, "Admin", "ADMIN" });
        }
    }
}
