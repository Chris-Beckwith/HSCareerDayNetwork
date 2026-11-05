using CareerDayApi.Entities;
using CareerDayApi.Models;
using FluentEmail.Core;
using FluentEmail.Core.Models;

namespace CareerDayApi.Services
{
    public class EmailService(IFluentEmail fluentEmail)
    {
        private readonly IFluentEmail _fluentEmail = fluentEmail;

        public async Task<SendResponse> SendLicenseInvitation(string email, string registrationUrl, LicenseType licenseType, DateTime expirationDate)
        {
            string licenseTypeString = "";
            switch (licenseType)
            {
                case LicenseType.Full: licenseTypeString = "Full Access"; break;
                case LicenseType.SurveyOnly: licenseTypeString = "Survey Only"; break;
            }

            var model = new LicenseInvitationEmailModel
            {
                RegistrationUrl = registrationUrl,
                LicenseType = licenseTypeString,
                ExpirationDate = expirationDate
            };

            var templatePath = Path.Combine(
                AppContext.BaseDirectory,
                "EmailTemplates",
                "LicenseInvitation.cshtml");

            return await _fluentEmail
                .To(email)
                .Subject("Thank You For Your National High School Career Day Purchase")
                .UsingTemplateFromFile(templatePath, model)
                .SendAsync();
        }
    }
}