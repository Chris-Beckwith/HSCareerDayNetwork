using CareerDayApi.Entities;
using Microsoft.AspNetCore.Identity;

namespace CareerDayApi.Data
{
    public static class DbInitializer
    {
        public static async Task Initialize(CareerDayContext context, UserManager<User> userManager)
        {
            var adminUsername = Environment.GetEnvironmentVariable("ADMIN_USERNAME");
            if (!string.IsNullOrEmpty(adminUsername))
            {
                User admin = await userManager.FindByNameAsync(adminUsername);

                if (admin == null)
                {
                    admin = new User
                    {
                        UserName = Environment.GetEnvironmentVariable("ADMIN_USERNAME"),
                        Email = Environment.GetEnvironmentVariable("ADMIN_EMAIL")
                    };
                    await userManager.CreateAsync(admin, Environment.GetEnvironmentVariable("ADMIN_PASSWORD"));
                }
                if (!await userManager.IsInRoleAsync(admin, "Admin"))
                {
                    await userManager.AddToRoleAsync(admin, "Admin");
                }
            }

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
                    ContactName = "Principal Skinner",
                    ContactPhone = "(310) 555-0078",
                    ContactEmail = "pskinner@springfield.com",
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
                    ContactName = "Homer Simpson",
                    ContactPhone = "(310) 555-1239",
                    ContactEmail = "hsimpson@nuclear.com",
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
                    // Careers = []
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

            var careers = new List<Career>
            {
                new() {
                    Name = "Animal Science",
                    CourseId = 101,
                    Category = "Agriculture, Food & Natural Resources",
                    Description = "veterinary medicine, vet tech, animal trainer, zoologist"
                },
                new() {
                    Name = "Food Science",
                    CourseId = 102,
                    Category = "Agriculture, Food & Natural Resources",
                    Description = "nutritionist, food production, packaging engineer"
                },
                new() {
                    Name = "Environmental Protection",
                    CourseId = 103,
                    Category = "Agriculture, Food & Natural Resources",
                    Description = "park ranger, natural resource tech, marine biologist, meteorologist"
                },
                new() {
                    Name = "Architecture",
                    CourseId = 201,
                    Category = "Architecture & Construction",
                    Description = "architect, urban planner, landscape design, historic preservation"
                },
                new() {
                    Name = "Building Construction & Development",
                    CourseId = 202,
                    Category = "Architecture & Construction",
                    Description = "contractor, civil engineer, project manager"
                },
                new() {
                    Name = "Interior Design",
                    CourseId = 203,
                    Category = "Architecture & Construction",
                    Description = ""
                },
                new() {
                    Name = "Acting",
                    CourseId = 301,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = "television/comercials, film, stage"
                },
                new() {
                    Name = "Communications/Public Relations",
                    CourseId = 302,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = "writing press releases, brand management"
                },
                new() {
                    Name = "Fashion",
                    CourseId = 303,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = "designer, buyer, merchandise"
                },
                new() {
                    Name = "Fine Arts",
                    CourseId = 304,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = "animators, painters, sculpotrs, illustrators"
                },
                new() {
                    Name = "Floral Design",
                    CourseId = 305,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = ""
                },
                new() {
                    Name = "Journalism",
                    CourseId = 306,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = "print, internet, broadcast reporting"
                },
                new() {
                    Name = "Media Arts",
                    CourseId = 307,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = "animators, special effects"
                },
                new() {
                    Name = "Music",
                    CourseId = 308,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = "composers, performers, producers"
                },
                new() {
                    Name = "Photography/Audio/Video",
                    CourseId = 309,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = "photographer, videographer, sound engineer, lighting engineer, video drone operator"
                },
                new() {
                    Name = "TV/Film Writer",
                    CourseId = 310,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = ""
                },
                new() {
                    Name = "TV/Film Production",
                    CourseId = 311,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = ""
                },
                new() {
                    Name = "Writer/Author",
                    CourseId = 312,
                    Category = "Arts, Audio/Video Technology & Communications",
                    Description = ""
                },
                new() {
                    Name = "Entrepreneur",
                    CourseId = 401,
                    Category = "Business, Management & Administration",
                    Description = "business owner"
                },
                new() {
                    Name = "General Management",
                    CourseId = 402,
                    Category = "Business, Management & Administration",
                    Description = ""
                },
                new() {
                    Name = "Human Resource Management",
                    CourseId = 403,
                    Category = "Business, Management & Administration",
                    Description = ""
                },
                new() {
                    Name = "High School/University",
                    CourseId = 501,
                    Category = "Education & Training",
                    Description = "professor, teacher, administrator"
                },
                new() {
                    Name = "Preschool/Elementary",
                    CourseId = 0,
                    Category = "Education & Training",
                    Description = "teacher, administrator"
                },
                new() {
                    Name = "Accounting",
                    CourseId = 601,
                    Category = "Finance",
                    Description = "auditor, tax account, bookkeeper, financial analyst"
                },
                new() {
                    Name = "Financial Services",
                    CourseId = 602,
                    Category = "Finance",
                    Description = "banking, money management"
                },
                new() {
                    Name = "Insurance",
                    CourseId = 603,
                    Category = "Finance",
                    Description = "actuary, fire & casualty agent, life & disability agent"
                },
                new() {
                    Name = "Securities and Investments",
                    CourseId = 604,
                    Category = "Finance",
                    Description = "stock broker"
                },
                new() {
                    Name = "Foreign Service",
                    CourseId = 701,
                    Category = "Government & Public Administration",
                    Description = "consular officer, diplomat, economic office"
                },
                new() {
                    Name = "Government/Public Service",
                    CourseId = 702,
                    Category = "Government & Public Administration",
                    Description = "legislators, jobs in local, state, and national government"
                },
                new() {
                    Name = "Dentistry",
                    CourseId = 801,
                    Category = "Health Science",
                    Description = "dentist, dental hygienist, oral surgeon, periodontist, endodontist"
                },
                new() {
                    Name = "Diagnostic Services",
                    CourseId = 802,
                    Category = "Health Science",
                    Description = "X-ray, MRI, CT tech"
                },
                new() {
                    Name = "Medical Assistant",
                    CourseId = 803,
                    Category = "Health Science",
                    Description = "Perform EKGs and lab tests, assist doctors with exams and procedures, take and record vital signs and medical histories, schedule patient appointments"
                },
                new() {
                    Name = "Nurse Practitioner/Physician Assistant",
                    CourseId = 804,
                    Category = "Health Science",
                    Description = ""
                },
                new() {
                    Name = "Ophthalmology/Optometry",
                    CourseId = 805,
                    Category = "Health Science",
                    Description = ""
                },
                new() {
                    Name = "Pharmacists/Pharmaceuticals/Pharmacy Tech",
                    CourseId = 806,
                    Category = "Health Science",
                    Description = ""
                },
                new() {
                    Name = "Physician/Surgeon",
                    CourseId = 807,
                    Category = "Health Science",
                    Description = ""
                },
                new() {
                    Name = "Physical Therapist",
                    CourseId = 808,
                    Category = "Health Science",
                    Description = ""
                },
                new() {
                    Name = "Radiology",
                    CourseId = 809,
                    Category = "Health Science",
                    Description = ""
                },
                new() {
                    Name = "Registered Nurse",
                    CourseId = 810,
                    Category = "Health Science",
                    Description = ""
                },
                new() {
                    Name = "Ultrasound Technician",
                    CourseId = 811,
                    Category = "Health Science",
                    Description = ""
                },
                new() {
                    Name = "Event Planning/Hospitality",
                    CourseId = 901,
                    Category = "Hospitality and Tourism",
                    Description = "venue/entertainment manager, catering, hotel occupations"
                },
                new() {
                    Name = "Culinary Arts",
                    CourseId = 902,
                    Category = "Hospitality and Tourism",
                    Description = "restaurants, chefs, and food and beverage services"
                },
                new() {
                    Name = "Sports/Business Management",
                    CourseId = 903,
                    Category = "Hospitality and Tourism",
                    Description = "athlete, coach, recreation, sports business careers"
                },
                new() {
                    Name = "Beauty",
                    CourseId = 1001,
                    Category = "Human Services",
                    Description = "hair stylist, make-up artist, cosmetologist, esthetician"
                },
                new() {
                    Name = "Fitness/Wellness",
                    CourseId = 1002,
                    Category = "Human Services",
                    Description = "personal trainer, healthy living, life coach, chiropractor"
                },
                new() {
                    Name = "Massage Therapist",
                    CourseId = 1003,
                    Category = "Human Services",
                    Description = ""
                },
                new() {
                    Name = "Psychology",
                    CourseId = 1004,
                    Category = "Human Services",
                    Description = "psychologists, marriage & family counselor"
                },
                new() {
                    Name = "Social Services",
                    CourseId = 1005,
                    Category = "Human Services",
                    Description = "humanitarian, nonprofit, social worker"
                },
                new() {
                    Name = "Computer Science/Software Engineer",
                    CourseId = 1101,
                    Category = "Information Technology",
                    Description = ""
                },
                new() {
                    Name = "IT/Cyber Security",
                    CourseId = 1102,
                    Category = "Information Technology",
                    Description = ""
                },
                new() {
                    Name = "Video Game Design/Development",
                    CourseId = 1103,
                    Category = "Information Technology",
                    Description = ""
                },
                new() {
                    Name = "Web Design/Development (coding)",
                    CourseId = 1104,
                    Category = "Information Technology",
                    Description = ""
                },
                new() {
                    Name = "Air Force/Space Force/Navy/Coast Guard",
                    CourseId = 1201,
                    Category = "Law, Public Safety, Corrections & Security",
                    Description = ""
                },
                new() {
                    Name = "Army/Marines",
                    CourseId = 1202,
                    Category = "Law, Public Safety, Corrections & Security",
                    Description = ""
                },
                new() {
                    Name = "Customs and Border Patrol",
                    CourseId = 1203,
                    Category = "Law, Public Safety, Corrections & Security",
                    Description = ""
                },
                new() {
                    Name = "Firefighter/Paramedic",
                    CourseId = 1204,
                    Category = "Law, Public Safety, Corrections & Security",
                    Description = ""
                },
                new() {
                    Name = "Law",
                    CourseId = 1205,
                    Category = "Law, Public Safety, Corrections & Security",
                    Description = "lawyer, paralegal, court reporter"
                },
                new() {
                    Name = "Law Enforcement/Security",
                    CourseId = 1206,
                    Category = "Law, Public Safety, Corrections & Security",
                    Description = "police, FBI, private security"
                },
                new() {
                    Name = "Lifeguard/EMT",
                    CourseId = 1207,
                    Category = "Law, Public Safety, Corrections & Security",
                    Description = ""
                },
                new() {
                    Name = "Trades",
                    CourseId = 1301,
                    Category = "Manufacturing",
                    Description = "electrician, plumber, welder"
                },
                new() {
                    Name = "Marketing/Professional Sales",
                    CourseId = 1401,
                    Category = "Marketing, Sales & Service",
                    Description = ""
                },
                new() {
                    Name = "Real Estate",
                    CourseId = 1402,
                    Category = "Marketing, Sales & Service",
                    Description = "realtor, title insurance, mortgage banker"
                },
                new() {
                    Name = "Social Media/Influencer",
                    CourseId = 1403,
                    Category = "Marketing, Sales & Service",
                    Description = ""
                },
                new() {
                    Name = "Astrophysics",
                    CourseId = 1501,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Biomedical Science",
                    CourseId = 1502,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Chemistry/Biometrics/DNA",
                    CourseId = 1503,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = "scientist, chemist, biochemist"
                },
                new() {
                    Name = "CSI/Forensics",
                    CourseId = 1504,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Data Scientist/Statistics",
                    CourseId = 1505,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Aerospace Engineering",
                    CourseId = 1506,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Computer/Software Engineering",
                    CourseId = 1507,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Electrical Engineering",
                    CourseId = 1508,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Mechanical Engineering",
                    CourseId = 1509,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Structural/Architectural Engineering",
                    CourseId = 1510,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = ""
                },
                new() {
                    Name = "Systems/Process Engineering",
                    CourseId = 1511,
                    Category = "Science, Technology, Engineering & Mathematics (STEM)",
                    Description = "Systems engineers oversee the entire life cycle of a project. A process or manufacturing process engineer designs and implements systems and equipment procedures used in manufacturing facilities."
                },
                new() {
                    Name = "Automotive",
                    CourseId = 1601,
                    Category = "Transportation, Distribution & Logistics",
                    Description = "mechanic, automobile sales, automobile services"
                },
                new() {
                    Name = "Aviation",
                    CourseId = 1602,
                    Category = "Transportation, Distribution & Logistics",
                    Description = "pilot, flight attendant, air traffic controller, airport administrationb"
                },
            };

            if (!context.Careers.Any()) context.Careers.AddRange(careers);

            context.SaveChanges();
        }
    }
}