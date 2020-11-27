using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace API.Models
{
    public class Category
    {
        [Key]
        public string CategoryName { get; set; }
        public List<Product> Products { get; set; } = new List<Product>();
    }
}
