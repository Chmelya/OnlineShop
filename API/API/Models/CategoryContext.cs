using Microsoft.EntityFrameworkCore;

namespace API.Models
{
    public class CategoryContext : DbContext
    {
        public DbSet<CategoryModel> Categories{ get; set; }
        public CategoryContext(DbContextOptions<CategoryContext> options) : base(options)
        {
            Database.EnsureCreated();
        }
    }
}
