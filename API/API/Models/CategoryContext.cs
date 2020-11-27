using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using API.Models;

namespace API.Models
{
    public class CategoryContext : DbContext
    {
        public DbSet<Category> Categories{ get; set; }
        public DbSet<Product> Products { get; set; }

   //     static string dummyText =
   //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

        //List<Product> products = new List<Product>(){
        //     new Product{ Id = 1, Title = "Office Code", Price = 234, Description = dummyText, Image = "assets/images/bag_1.png"},
        //     new Product{ Id = 2, Title = "hewgewgweg", Price = 54, Description = dummyText, Image = "assets/images/bag_1.png"},
        //     new Product{ Id = 3, Title = "grwrewreegeb", Price = 46, Description = dummyText, Image = "assets/images/bag_1.png"},
        //     new Product{ Id = 4, Title = "Oj44j5j", Price = 26, Description = dummyText, Image = "assets/images/bag_1.png"},
        //     new Product{ Id = 5, Title = "cxxbcznc", Price = 1134, Description = dummyText, Image = "assets/images/bag_1.png"},
        //     new Product{ Id = 6, Title = "geerewrye", Price = 4, Description = dummyText, Image = "assets/images/bag_1.png"},
        //};
        public CategoryContext(DbContextOptions<CategoryContext> options) : base(options)
        {
            Database.EnsureDeleted();
            Database.EnsureCreated();
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>()
                .HasOne<Category>(p => p.Category)
                .WithMany(c => c.Products)
                .HasForeignKey(p => p.CategoryName);

            //Category category = new Category { CategoryName = "HandBags" };
            //modelBuilder.Entity<Category>().HasData(category);
            //modelBuilder.Entity<Product>().HasData(new Product { Id = 1, Title = "Office Code", Price = 234, Description = dummyText, Image = "assets/images/bag_1.png", Category = category });
            //modelBuilder.Entity<Product>().HasData(new Product { Id = 2, Title = "hewgewgweg", Price = 54, Description = dummyText, Image = "assets/images/bag_1.png", Category = category });
            //modelBuilder.Entity<Product>().HasData(new Product { Id = 3, Title = "grwrewreegeb", Price = 46, Description = dummyText, Image = "assets/images/bag_1.png", Category = category });
            //modelBuilder.Entity<Product>().HasData(new Product { Id = 4, Title = "Oj44j5j", Price = 26, Description = dummyText, Image = "assets/images/bag_1.png", Category = category });
            //modelBuilder.Entity<Product>().HasData(new Product { Id = 5, Title = "cxxbcznc", Price = 1134, Description = dummyText, Image = "assets/images/bag_1.png", Category = category });
            //modelBuilder.Entity<Product>().HasData(new Product { Id = 6, Title = "geerewrye", Price = 4, Description = dummyText, Image = "assets/images/bag_1.png", Category = category });
        }
    }
}
