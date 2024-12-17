using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class sessionStudentAndSpeakerRelationship : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Speakers_Sessions_SessionId",
                table: "Speakers");

            migrationBuilder.DropForeignKey(
                name: "FK_Students_Sessions_SessionId",
                table: "Students");

            migrationBuilder.DropIndex(
                name: "IX_Students_SessionId",
                table: "Students");

            migrationBuilder.DropIndex(
                name: "IX_Speakers_SessionId",
                table: "Speakers");

            migrationBuilder.DropColumn(
                name: "SessionId",
                table: "Students");

            migrationBuilder.DropColumn(
                name: "SessionId",
                table: "Speakers");

            migrationBuilder.CreateTable(
                name: "SessionSpeaker",
                columns: table => new
                {
                    SessionsId = table.Column<int>(type: "integer", nullable: false),
                    SpeakersId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SessionSpeaker", x => new { x.SessionsId, x.SpeakersId });
                    table.ForeignKey(
                        name: "FK_SessionSpeaker_Sessions_SessionsId",
                        column: x => x.SessionsId,
                        principalTable: "Sessions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SessionSpeaker_Speakers_SpeakersId",
                        column: x => x.SpeakersId,
                        principalTable: "Speakers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SessionStudent",
                columns: table => new
                {
                    SessionsId = table.Column<int>(type: "integer", nullable: false),
                    StudentsId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SessionStudent", x => new { x.SessionsId, x.StudentsId });
                    table.ForeignKey(
                        name: "FK_SessionStudent_Sessions_SessionsId",
                        column: x => x.SessionsId,
                        principalTable: "Sessions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SessionStudent_Students_StudentsId",
                        column: x => x.StudentsId,
                        principalTable: "Students",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SessionSpeaker_SpeakersId",
                table: "SessionSpeaker",
                column: "SpeakersId");

            migrationBuilder.CreateIndex(
                name: "IX_SessionStudent_StudentsId",
                table: "SessionStudent",
                column: "StudentsId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SessionSpeaker");

            migrationBuilder.DropTable(
                name: "SessionStudent");

            migrationBuilder.AddColumn<int>(
                name: "SessionId",
                table: "Students",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SessionId",
                table: "Speakers",
                type: "integer",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Students_SessionId",
                table: "Students",
                column: "SessionId");

            migrationBuilder.CreateIndex(
                name: "IX_Speakers_SessionId",
                table: "Speakers",
                column: "SessionId");

            migrationBuilder.AddForeignKey(
                name: "FK_Speakers_Sessions_SessionId",
                table: "Speakers",
                column: "SessionId",
                principalTable: "Sessions",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Sessions_SessionId",
                table: "Students",
                column: "SessionId",
                principalTable: "Sessions",
                principalColumn: "Id");
        }
    }
}
