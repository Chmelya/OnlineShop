using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }
        public string Image { get; set; }
        public string Title { get; set; }
        public string Description { get; set; } 
        public double Price { get; set; }
        public string CategoryName { get; set; }
        public Category Category { get; set; }
    }
}
