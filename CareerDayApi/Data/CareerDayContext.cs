using CareerDayApi.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CareerDayApi.Data
{
    public class CareerDayContext(DbContextOptions options) : IdentityDbContext<User>(options)
    {
        // Database Tables
        public DbSet<School> Schools { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Survey> Surveys { get; set; }
        public DbSet<Speaker> Speakers { get; set; }
        public DbSet<Career> Careers { get; set; }
        public DbSet<Event> Events { get; set; }
        public DbSet<EventPhase> EventPhases { get; set; }
        public DbSet<Classroom> Classrooms { get; set; }
        public DbSet<CareerSet> CareerSets { get; set; }
        public DbSet<Session> Sessions { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<Event>()
                .HasMany(s => s.Speakers)
                .WithMany();

            builder.Entity<Event>()
                .HasMany(c => c.Careers)
                .WithMany();

            builder.Entity<Speaker>()
                .HasMany(c => c.Careers)
                .WithMany();

            builder.Entity<Speaker>()
                .HasOne(s => s.Address)
                .WithOne()
                .HasForeignKey<SpeakerAddress>(a => a.Id)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<Career>()
                .HasIndex(c => c.CourseId)
                .IsUnique();

            builder.Entity<Career>()
                .HasIndex(c => c.Name)
                .IsUnique();

            builder.Entity<CareerSet>()
                .HasMany(cs => cs.Careers)
                .WithMany();

            builder.Entity<Student>()
                .HasIndex(s => new { s.StudentNumber, s.EventId })
                .IsUnique();

            builder.Entity<Survey>()
                .HasOne(s => s.Student)
                .WithOne()
                .HasForeignKey<Survey>(s => s.StudentId);

            builder.Entity<Survey>()
                .HasMany(s => s.PrimaryCareers)
                .WithMany()
                .UsingEntity(j => j.ToTable("SurveyPrimaryCareers"));

            builder.Entity<Survey>()
                .HasMany(s => s.SecondaryCareers)
                .WithMany()
                .UsingEntity(j => j.ToTable("SurveySecondaryCareers"));

            builder.Entity<Survey>()
                .HasIndex(s => s.StudentId)
                .IsUnique();

            builder.Entity<IdentityRole>()
                .HasData(
                    new IdentityRole{Name = "Admin", NormalizedName = "ADMIN"}
                );
        }

    }
}