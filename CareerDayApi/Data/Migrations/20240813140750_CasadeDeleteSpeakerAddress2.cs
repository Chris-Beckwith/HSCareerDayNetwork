using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class CasadeDeleteSpeakerAddress2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SpeakerAddress_Speakers_SpeakerId",
                table: "SpeakerAddress");

            migrationBuilder.DropIndex(
                name: "IX_SpeakerAddress_SpeakerId",
                table: "SpeakerAddress");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "9d1f5202-7fca-4c39-be44-03e24e28a430");

            migrationBuilder.DropColumn(
                name: "SpeakerId",
                table: "SpeakerAddress");

            migrationBuilder.DropColumn(
                name: "Address_Id",
                table: "Schools");

            migrationBuilder.AlterColumn<int>(
                name: "Id",
                table: "SpeakerAddress",
                type: "integer",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer")
                .OldAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "e39bbb20-8e10-45db-9298-9ae0991b3e5c", null, "Admin", "ADMIN" });

            migrationBuilder.AddForeignKey(
                name: "FK_SpeakerAddress_Speakers_Id",
                table: "SpeakerAddress",
                column: "Id",
                principalTable: "Speakers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SpeakerAddress_Speakers_Id",
                table: "SpeakerAddress");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "e39bbb20-8e10-45db-9298-9ae0991b3e5c");

            migrationBuilder.AlterColumn<int>(
                name: "Id",
                table: "SpeakerAddress",
                type: "integer",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "integer")
                .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

            migrationBuilder.AddColumn<int>(
                name: "SpeakerId",
                table: "SpeakerAddress",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Address_Id",
                table: "Schools",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "9d1f5202-7fca-4c39-be44-03e24e28a430", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_SpeakerAddress_SpeakerId",
                table: "SpeakerAddress",
                column: "SpeakerId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_SpeakerAddress_Speakers_SpeakerId",
                table: "SpeakerAddress",
                column: "SpeakerId",
                principalTable: "Speakers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
