using System.ComponentModel.DataAnnotations;

namespace API.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }
        public string Image { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Subtitle { get; set; }
        public double Price { get; set; }
        public string CategoryName { get; set; }
        public Category Category { get; set; }
    }
}
