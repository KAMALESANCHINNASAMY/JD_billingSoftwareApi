using BillingSoftware.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace BillingSoftware.Controllers
{
    public class UserProfileDbContext : DbContext
    {
        public DbSet<UserLoginModel> Users { get; set; }

        private readonly IConfiguration _configuration;

        public UserProfileDbContext(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DefaultConnection"));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserLoginModel>().ToTable("user_profile");
        }
    }
}
