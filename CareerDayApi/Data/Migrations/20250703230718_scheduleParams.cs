using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace CareerDayApi.Data.Migrations
{
    /// <inheritdoc />
    public partial class scheduleParams : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ScheduleParams",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    EventId = table.Column<int>(type: "integer", nullable: false),
                    MaxClassSize = table.Column<int>(type: "integer", nullable: false),
                    MinClassSize = table.Column<int>(type: "integer", nullable: false),
                    PeriodCount = table.Column<int>(type: "integer", nullable: false),
                    RequiredPeriodForCareerListJson = table.Column<string>(type: "text", nullable: true),
                    SameSpeakersForCareerListJson = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ScheduleParams", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ScheduleParams_EventId",
                table: "ScheduleParams",
                column: "EventId",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ScheduleParams");
        }
    }
}
