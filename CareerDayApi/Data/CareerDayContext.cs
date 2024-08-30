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
        public DbSet<Speaker> Speakers { get; set; }
        public DbSet<Career> Careers { get; set; }
        public DbSet<Event> Events { get; set; }
        public DbSet<EventPhase> EventPhases { get; set; }
        public DbSet<Classroom> Classrooms { get; set; }

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

            builder.Entity<IdentityRole>()
                .HasData(
                    new IdentityRole{Name = "Admin", NormalizedName = "ADMIN"}
                );
        }

    }
}