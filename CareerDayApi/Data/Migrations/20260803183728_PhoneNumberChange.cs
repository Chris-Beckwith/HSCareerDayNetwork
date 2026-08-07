using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class PhoneNumberChange : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PhoneNumbers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Number = table.Column<string>(type: "text", nullable: true),
                    Ext = table.Column<string>(type: "text", nullable: true),
                    Type = table.Column<int>(type: "integer", nullable: false),
                    IsPrimary = table.Column<bool>(type: "boolean", nullable: false),
                    SpeakerId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PhoneNumbers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PhoneNumbers_Speakers_SpeakerId",
                        column: x => x.SpeakerId,
                        principalTable: "Speakers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CareerSets_Name",
                table: "CareerSets",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_PhoneNumbers_SpeakerId",
                table: "PhoneNumbers",
                column: "SpeakerId");

            migrationBuilder.Sql(@"
                INSERT INTO ""PhoneNumbers""
                    (""SpeakerId"", ""Number"", ""Ext"", ""Type"", ""IsPrimary"")
                SELECT
                    ""Id"",
                    ""PhoneNumber"",
                    NULL,
                    0,
                    TRUE
                FROM ""Speakers""
                WHERE ""PhoneNumber"" IS NOT NULL
                AND ""PhoneNumber"" <> '';
            ");

            migrationBuilder.DropColumn(
                name: "PhoneNumber",
                table: "Speakers");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_CareerSets_Name",
                table: "CareerSets");

            migrationBuilder.AddColumn<string>(
                name: "PhoneNumber",
                table: "Speakers",
                type: "text",
                nullable: true);

            migrationBuilder.Sql(@"
                UPDATE ""Speakers"" s
                SET ""PhoneNumber"" = p.""Number""
                FROM ""PhoneNumbers"" p
                WHERE p.""SpeakerId"" = s.""Id""
                AND p.""IsPrimary"" = TRUE;
            ");

            migrationBuilder.DropTable(
                name: "PhoneNumbers");
        }
    }
}
