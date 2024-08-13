using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class CasadeDeleteSpeakerAddress : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Speakers_SpeakerAddress_AddressId",
                table: "Speakers");

            migrationBuilder.DropIndex(
                name: "IX_Speakers_AddressId",
                table: "Speakers");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5dd17b1c-86d0-4c63-9d71-8eea0bbd534c");

            migrationBuilder.DropColumn(
                name: "AddressId",
                table: "Speakers");

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
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

            migrationBuilder.AddColumn<int>(
                name: "AddressId",
                table: "Speakers",
                type: "integer",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "5dd17b1c-86d0-4c63-9d71-8eea0bbd534c", null, "Admin", "ADMIN" });

            migrationBuilder.CreateIndex(
                name: "IX_Speakers_AddressId",
                table: "Speakers",
                column: "AddressId");

            migrationBuilder.AddForeignKey(
                name: "FK_Speakers_SpeakerAddress_AddressId",
                table: "Speakers",
                column: "AddressId",
                principalTable: "SpeakerAddress",
                principalColumn: "Id");
        }
    }
}
