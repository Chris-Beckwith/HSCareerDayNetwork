using CareerDayApi.Entities;
using Microsoft.AspNetCore.Identity;

namespace CareerDayApi.Data
{
    public static class DbInitializer
    {
        public static async Task Initialize(CareerDayContext context, UserManager<User> userManager)
        {
            if (!userManager.Users.Any())
            {
                var admin = new User
                {
                    UserName = "TempAdmin",
                    Email = "srappaport@hscareerdaynetwork.com"
                };

                await userManager.CreateAsync(admin, "P@ssw0rd");
                await userManager.AddToRoleAsync(admin, "Admin");
            }

            if (context.Schools.Any() 
                && context.Speakers.Any()
                && context.EventPhases.Any()
                && context.Events.Any()) return;

            var schools = new List<School>
            {
                new() {
                    Name = "El Segundo High School",
                    Address = new() {
                        Address1 = "640 Main St.",
                        City = "El Segundo",
                        State = "CA",
                        Zip = "90245",
                        Country = "USA",
                    },
                    EstimatedNumOfStudents = 1300
                },
                new() {
                    Name = "Test High School",
                    Address = new() {
                        Address1 = "123 Fake St.",
                        City = "Nowhere Town",
                        State = "CA",
                        Zip = "12345",
                        Country = "USA",
                    },
                    EstimatedNumOfStudents = 123
                }
            };

            if (!context.Schools.Any()) context.Schools.AddRange(schools);

            var speakers = new List<Speaker>
            {
                new() {
                    LastName = "Test",
                    MiddleName = "Middle",
                    FirstName = "First",
                    Title = "TitleTest",
                    Company = "CompanyTest",
                    PortraitUrl = "/images/cure.jpg",
                    Email = "Test@test.com",
                    PhoneNumber = "12345678900",
                    Address = new SpeakerAddress {
                        Address1 = "123 Test St",
                        City = "Testcity",
                        State = "CA",
                        Zip = "90000",
                        Country = "USA"
                    },
                    Careers = [
                        new() {
                            Name = "Test Career",
                            Description = "Test Career Description"
                        },
                        new() {
                            Name = "Test Career2",
                            Description = "Test Career Description2"
                        }
                    ]
                },
                new() {
                    LastName = "Beckwith",
                    MiddleName = "William",
                    FirstName = "Chris",
                    Title = "Lead Developer",
                    Company = "Foil Forest",
                    PortraitUrl = "/images/chris.png",
                    Email = "Cbeckwit1@gmail.com",
                    PhoneNumber = "12345678900",
                    // Careers = []
                },
                new() {
                    LastName = "Cohen",
                    MiddleName = "Baron",
                    FirstName = "Sacha",
                    Title = "Documentarian",
                    Company = "Cultural Learnings of America for Make Benefit Glorius Nation of Kazakhstan",
                    PortraitUrl = "/images/borat.jpg",
                    Email = "Borat@Kazakhstan.com",
                    PhoneNumber = "12345678900",
                    // Careers = []
                },
                new() {
                    LastName = "Hook",
                    MiddleName = "Pirate",
                    FirstName = "Captain",
                    Title = "Pirate Captain",
                    Company = "Black Pearl",
                    PortraitUrl = "/images/pirate.jpg",
                    Email = "Pirate@Hook.com",
                    PhoneNumber = "12345678900",
                    // Careers = []
                },
                new() {
                    LastName = "Wut",
                    MiddleName = "What",
                    FirstName = "Wat",
                    Title = "Journalist",
                    Company = "NBC",
                    PortraitUrl = "/images/wat.jpg",
                    Email = "wat@nbc.gov",
                    PhoneNumber = "12345678900",
                    // Careers = []
                },
            };

            if (!context.Speakers.Any()) context.Speakers.AddRange(speakers);

            var eventPhases = new List<EventPhase>
            {
                new() { PhaseName = "Created" },
                new() { PhaseName = "Survey In Progress" },
                new() { PhaseName = "Survey Closed" },
                new() { PhaseName = "Sessions Generated" },
                new() { PhaseName = "Rooms Assigned" },
                new() { PhaseName = "Speakers Assigned" },
                new() { PhaseName = "Ready for Schedule Export" },
                new() { PhaseName = "Completed" },
                new() { PhaseName = "Cancelled" },
            };

            if (!context.EventPhases.Any()) context.EventPhases.AddRange(eventPhases);

            var events = new List<Event>
            {
                new() {
                    Name = "El Segundo CD Event Test",
                    School = schools[0],
                    EventDate = new DateTime(2025, 3, 7).ToUniversalTime(),
                    Description  = "Test description for El Segundo Test Event.  Some more text",
                    EventPhase = eventPhases[0],
                    Speakers = {
                        speakers[1]
                    }
                },
                new() {
                    Name = "Test School Event for Test School",
                    School = schools[1],
                    EventDate = new DateTime(2025, 4, 8).ToUniversalTime(),
                    Description  = "Test description for Test School Event.  Test test test",
                    EventPhase = eventPhases[1],
                    SurveyCompletePercent = 35,
                    Speakers = {
                        speakers[0],
                        speakers[1],
                        speakers[2],
                        new Speaker {
                            LastName = "NewTest",
                            MiddleName = "NewMiddle",
                            FirstName = "NewFirst",
                            Title = "NewTitle",
                            Company = "NewCompanyTest",
                            PortraitUrl = "/images/pirate.jpg",
                            Email = "NewTest@newTest.com",
                            PhoneNumber = "12345678900",
                        }
                    }
                },
            };

            if (!context.Events.Any()) context.Events.AddRange(events);

            context.SaveChanges();
        }
    }
}