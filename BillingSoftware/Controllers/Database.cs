using Microsoft.Extensions.Configuration;
using System.IO;

namespace BillingSoftware.Controllers
{
    public class Database
    {
        public Database() { }

        public string GetConnectionString()
        {
            var configuation = GetConfiguration();
            return configuation.GetSection("ConnectionStrings").GetSection("DefaultConnection").Value;
        }

        public IConfigurationRoot GetConfiguration()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
            return builder.Build();
        }
    }
}
