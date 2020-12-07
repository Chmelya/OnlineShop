using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using API.Models;

namespace API.Models
{
    public class CategoryContext : DbContext
    {
        public DbSet<Category> Categories{ get; set; }
        public DbSet<Product> Products { get; set; }

        public CategoryContext(DbContextOptions<CategoryContext> options) : base(options)
        {
            //Database.EnsureDeleted();
            Database.EnsureCreated();
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>()
                .HasOne<Category>(p => p.Category)
                .WithMany(c => c.Products)
                .HasForeignKey(p => p.CategoryName);

            string dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

            modelBuilder.Entity<Category>().HasData(
                new Category[]
                {
                     new Category { CategoryName = "HandBags" }
                });

            modelBuilder.Entity<Product>().HasData(
                new Product[]
                {
                    new Product { Id = 1, Title = "Office Code", Subtitle = "Beautiful Bag", Price = 235.00, Description = dummyText, Image = "assets/images/bag_1.png", CategoryName = "HandBags"},
                    new Product { Id = 2, Title = "Belt Bag", Subtitle = "Beautiful Bag", Price = 154.99, Description = dummyText, Image = "assets/images/bag_2.png", CategoryName =  "HandBags" },
                    new Product { Id = 3, Title = "Hang Top", Subtitle = "Beautiful Bag", Price = 49.99, Description = dummyText, Image = "assets/images/bag_3.png", CategoryName =  "HandBags" },
                    new Product { Id = 4, Title = "Old Fashion", Subtitle = "Beautiful Bag", Price = 264.99, Description = dummyText, Image = "assets/images/bag_4.png", CategoryName =  "HandBags" },
                    new Product { Id = 5, Title = "Office Code", Subtitle = "Office Bag", Price = 324.00, Description = dummyText, Image = "assets/images/bag_5.png", CategoryName =  "HandBags" },
                    new Product { Id = 6, Title = "Office Code", Subtitle = "Office Bag", Price = 45.50, Description = dummyText, Image = "assets/images/bag_6.png", CategoryName =  "HandBags" }
                });
    
        }
    }
}
