using Microsoft.AspNetCore.Mvc;
using API.Models;
using System;
using System.Linq;

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

            //Category category = new Category { CategoryName = "HandBags" };
            //db.Categories.Add(category);

            Product product1 = new Product { Title = "Office Code", Subtitle = "Beautiful Bag", Price = 235.00, Description = dummyText, Image = "assets/images/bag_1.png", CategoryName = "HandBags" };
            Product product2 = new Product { Title = "Belt Bag", Subtitle = "Beautiful Bag", Price = 154.99, Description = dummyText, Image = "assets/images/bag_2.png", CategoryName = "HandBags" };
            Product product3 = new Product { Title = "Hang Top", Subtitle = "Beautiful Bag", Price = 49.99, Description = dummyText, Image = "assets/images/bag_3.png", CategoryName = "HandBags" };
            Product product4 = new Product { Title = "Old Fashion", Subtitle = "Beautiful Bag", Price = 264.99, Description = dummyText, Image = "assets/images/bag_4.png", CategoryName = "HandBags" };
            Product product5 = new Product { Title = "Office Code", Subtitle = "Office Bag", Price = 324.00, Description = dummyText, Image = "assets/images/bag_5.png", CategoryName = "HandBags" };
            Product product6 = new Product { Title = "Office Code", Subtitle = "Office Bag", Price = 45.50, Description = dummyText, Image = "assets/images/bag_6.png", CategoryName = "HandBags" };

            db.Products.AddRange(product1, product2, product3, product4, product5, product6);

            db.SaveChanges();
        }

        // GET shop/Products/{category}
        [HttpGet("{category}")]
        public ActionResult GetCategoryProducts(string category)
        {
            try
            {
                var response = from prod in db.Categories.Find(category).Products
                               select new { prod.Id, prod.Image, prod.Price, prod.Title, prod.Description, prod.Subtitle };

                Response.Headers.Add("Content-Type", "application/json");

                return Json(response);
            }
            catch (NullReferenceException)
            {
                return BadRequest();
            }

        }
    }
}
