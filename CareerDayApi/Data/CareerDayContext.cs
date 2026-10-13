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
        public DbSet<ScheduleParams> ScheduleParams { get; set; }
        public DbSet<PhoneNumber> PhoneNumbers { get; set; }
        public DbSet<License> Licenses { get; set; }
        public DbSet<LicenseInvitation> LicenseInvitations { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<School>()
                .HasIndex(s => new { s.LicenseId, s.Name })
                .IsUnique();

            //For GlobalAdmin to retain uniqueness
            builder.Entity<School>()
                .HasIndex(s => s.Name)
                .IsUnique()
                .HasFilter("\"LicenseId\" IS NULL");

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
                .HasIndex(c => new { c.LicenseId, c.Name })
                .IsUnique();

            //For GlobalAdmin to retain uniqueness
            builder.Entity<Career>()
                .HasIndex(c => c.Name)
                .IsUnique()
                .HasFilter("\"LicenseId\" IS NULL");

            builder.Entity<Career>()
                .HasIndex(c => c.Name)
                .IsUnique();

            builder.Entity<CareerSet>()
                .HasIndex(cs => new { cs.LicenseId, cs.Name })
                .IsUnique();

            //For GlobalAdmin to retain uniqueness
            builder.Entity<CareerSet>()
                .HasIndex(cs => cs.Name)
                .IsUnique()
                .HasFilter("\"LicenseId\" IS NULL");
                
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
                .HasMany(s => s.AlternateCareers)
                .WithMany()
                .UsingEntity(j => j.ToTable("SurveyAlternateCareers"));

            builder.Entity<Survey>()
                .HasIndex(s => s.StudentId)
                .IsUnique();

            builder.Entity<Classroom>()
                .HasIndex( c => new { c.SchoolId, c.Building, c.RoomNumber })
                .IsUnique();

            builder.Entity<Session>()
                .HasMany(s => s.Students)
                .WithMany(s => s.Sessions);

            builder.Entity<Session>()
                .HasMany(s => s.Speakers)
                .WithMany(s => s.Sessions);

            builder.Entity<ScheduleParams>()
                .HasIndex(sp => sp.EventId)
                .IsUnique();

            builder.Entity<User>()
                .Property(u => u.Email)
                .HasMaxLength(254);

            builder.Entity<User>()
                .Property(u => u.UserName)
                .HasMaxLength(50);

            // builder.Entity<IdentityRole>()
            //     .HasData(
            //         new IdentityRole{
            //             Id = "26a8eac8-f02a-46e3-923a-11ccd8a42cb1",
            //             Name = "Admin",
            //             NormalizedName = "ADMIN"
            //         }
            //     );

            // builder.Entity<IdentityRole>()
            //     .HasData(
            //         new IdentityRole{
            //             Id = "28f040ce-d05d-4996-b30f-674ed9e3eda4",
            //             Name = "SchoolUser",
            //             NormalizedName = "SCHOOLUSER"
            //         }
            //     );

            builder.Entity<IdentityRole>()
                .HasData(
                    new IdentityRole
                    {
                        Id = "26a8eac8-f02a-46e3-923a-11ccd8a42cb1",
                        Name = "Admin",
                        NormalizedName = "ADMIN"
                    },
                    new IdentityRole
                    {
                        Id = "28f040ce-d05d-4996-b30f-674ed9e3eda4",
                        Name = "SchoolUser",
                        NormalizedName = "SCHOOLUSER"
                    },
                    new IdentityRole
                    {
                        Id = "2afe299e-84ba-4abb-bb60-cee87e35ceab",
                        Name = "FullLicenseUser",
                        NormalizedName = "FULLLICENSEUSER"
                    },
                    new IdentityRole
                    {
                        Id = "2c4f6fc3-fa99-4d40-a2da-84e76e30f303",
                        Name = "SurveyLicenseUser",
                        NormalizedName = "SURVEYLICENSEUSER"
                    }
                );

            builder.Entity<School>()
                .HasOne(s => s.License)
                .WithMany(l => l.Schools)
                .HasForeignKey(s => s.LicenseId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.Entity<Event>()
                .HasOne(e => e.License)
                .WithMany(l => l.Events)
                .HasForeignKey(e => e.LicenseId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.Entity<Career>()
                .HasOne(c => c.License)
                .WithMany(l => l.Careers)
                .HasForeignKey(c => c.LicenseId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.Entity<CareerSet>()
                .HasOne(cs => cs.License)
                .WithMany(l => l.CareerSets)
                .HasForeignKey(cs => cs.LicenseId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.Entity<Speaker>()
                .HasOne(s => s.License)
                .WithMany(l => l.Speakers)
                .HasForeignKey(s => s.LicenseId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.Entity<User>()
                .HasOne(u => u.License)
                .WithMany(l => l.Users)
                .HasForeignKey(u => u.LicenseId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}