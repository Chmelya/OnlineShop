using Microsoft.EntityFrameworkCore;

namespace API.Models
{

    public class OrderContext : DbContext
    {
        public DbSet<Order> Orders { get; set; }
        public DbSet<Purchase> Purchases { get; set; }
        public OrderContext(DbContextOptions<OrderContext> options) : base(options)
        {
            //Database.EnsureDeleted();
            Database.EnsureCreated();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Purchase>()
                .HasOne<Order>(p => p.Order)
                .WithMany(o => o.Purchases)
                .HasForeignKey(p => p.OrderID);
        }
    }
}
