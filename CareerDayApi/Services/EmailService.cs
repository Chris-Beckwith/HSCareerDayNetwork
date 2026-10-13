using CareerDayApi.Models;
using FluentEmail.Core;
using FluentEmail.Core.Models;

namespace CareerDayApi.Services
{
    public class EmailService(IFluentEmail fluentEmail)
    {
        private readonly IFluentEmail _fluentEmail = fluentEmail;

        public async Task<SendResponse> SendLicenseInvitation(string email, string registrationUrl, DateTime expirationDate)
        {
            var model = new LicenseInvitationEmailModel
            {
                RegistrationUrl = registrationUrl,
                ExpirationDate = expirationDate
            };

            var templatePath = Path.Combine(
                AppContext.BaseDirectory,
                "EmailTemplates",
                "LicenseInvitation.cshtml");

            return await _fluentEmail
                .To(email)
                .Subject("You're invited to High School Career Day Survey")
                .UsingTemplateFromFile(templatePath, model)
                .SendAsync();
        }
    }
}