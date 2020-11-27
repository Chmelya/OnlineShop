using Microsoft.AspNetCore.Mvc;
using API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    [ApiController]
    [Route("shop/[controller]")]
    public class ProductsController : Controller
    {
        CategoryContext db;
        static string dummyText =
   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
        public ProductsController(CategoryContext context)
        {
            db = context;

            Category category = new Category { CategoryName = "HandBags" };
            db.Categories.Add(category);

            Product product1 = new Product { Title = "Office Code", Price = 234, Description = dummyText, Image = "assets/images/bag_1.png", Category = category };
            Product product2 = new Product { Title = "hewgewgweg", Price = 54, Description = dummyText, Image = "assets/images/bag_1.png", Category = category };
            Product product3 = new Product { Title = "grwrewreegeb", Price = 46, Description = dummyText, Image = "assets/images/bag_1.png", Category = category };
            Product product4 = new Product { Title = "Oj44j5j", Price = 26, Description = dummyText, Image = "assets/images/bag_1.png", Category = category };
            Product product5 = new Product { Title = "cxxbcznc", Price = 1134, Description = dummyText, Image = "assets/images/bag_1.png", Category = category };
            Product product6 = new Product { Title = "geerewrye", Price = 4, Description = dummyText, Image = "assets/images/bag_1.png", Category = category };

            db.Products.AddRange(product1, product2, product3, product4, product5, product6);

            db.SaveChanges();
        }

        // GET shop/products/catiegory
        [HttpGet("{category}")]
        public ActionResult GetCategoryProducts(string category)
        {
            Response.Headers.Add("Content-Type", "application/json");

            try
            {
                var response = db.Categories.Find(category).Products;
                foreach (var item in response)
                {

                }
                return Json(response);
            }
            catch (NullReferenceException)
            {
                return BadRequest();

            }
        }
    }
}
