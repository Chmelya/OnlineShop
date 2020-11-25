using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    public class CategoryModel
    {
        public string CategoryName { get; set; }
        public List<ProductModel> Products { get; set; }
    }
}
