using Microsoft.EntityFrameworkCore;

namespace API.Models
{
    public class UserContext : DbContext
    {
        DbSet<User> Users { get; set; }
        public UserContext(DbContextOptions<CategoryContext> options) : base(options)
        {
            Database.EnsureCreated();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().HasData(
                new User[]
                {
                    new User() {Id = 1, Name = "Bob", Password = "12345678"}
                }    
            );
        }
    }
}
