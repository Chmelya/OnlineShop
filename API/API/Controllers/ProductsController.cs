using Microsoft.AspNetCore.Mvc;
using API.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    /// <summary>
    /// Provides information about products.
    /// </summary>
    [ApiController]
    [Route("shop/[controller]")]
    public class ProductsController : Controller
    {
        CategoryContext db;
      static string dummyText =
   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

        /// <summary>
        /// Initialize controller.
        /// </summary>
        /// <param name="context">Intialize database context of products.</param> 
        public ProductsController(CategoryContext context)
        {
            db = context;

            //db.Categories.Add(new Category { CategoryName = "Sneakers" });
            //db.Categories.Add(new Category { CategoryName = "Sliders" });
            //db.Categories.Add(new Category { CategoryName = "Shoes" });
            //db.Categories.Add(new Category { CategoryName = "Boots" });

            db.Products.Add(new Product { Title = "Nike Free", Subtitle = "Nike Air Max", Price = 139.99, Description = dummyText, Image = "assets/images/nike.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Jordan", Subtitle = "Nike Air Max", Price = 239.99, Description = dummyText, Image = "assets/images/air1.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Old Scool", Subtitle = "VANS", Price = 59.99, Description = dummyText, Image = "assets/images/vans.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Supreme", Subtitle = "Nike Air Max", Price = 559.99, Description = dummyText, Image = "assets/images/air3.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Superstar", Subtitle = "Adidas", Price = 129.99, Description = dummyText, Image = "assets/images/adidas.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Air Force", Subtitle = "Nike", Price = 169.99, Description = dummyText, Image = "assets/images/nike2.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Nike Run", Subtitle = "Nike", Price = 229.99, Description = dummyText, Image = "assets/images/nike3.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Jordan Red", Subtitle = "Nike Air Max", Price = 159.99, Description = dummyText, Image = "assets/images/air2.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Nike R", Subtitle = "Nike", Price = 99.99, Description = dummyText, Image = "assets/images/nike4.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Puma Skate", Subtitle = "Puma", Price = 89.99, Description = dummyText, Image = "assets/images/puma.png", CategoryName = "Sneakers" });
            db.Products.Add(new Product { Title = "Jordan Gold", Subtitle = "Nike Air Max", Price = 459.99, Description = dummyText, Image = "assets/images/air4.png", CategoryName = "Sneakers" });

            db.Products.Add(new Product { Title = "Nike Free", Subtitle = "Nike Air Max", Price = 139.99, Description = dummyText, Image = "assets/images/slid1.png", CategoryName = "Sliders" });
            db.Products.Add(new Product { Title = "Jordan", Subtitle = "Nike Air Max", Price = 239.99, Description = dummyText, Image = "assets/images/slid2.png", CategoryName = "Sliders" });
            db.Products.Add(new Product { Title = "Old Scool", Subtitle = "VANS", Price = 59.99, Description = dummyText, Image = "assets/images/slid3.png", CategoryName = "Sliders" });
            
            db.Products.Add(new Product { Title = "Supreme", Subtitle = "Nike Air Max", Price = 559.99, Description = dummyText, Image = "assets/images/shoes1.png", CategoryName = "Shoes" });
            db.Products.Add(new Product { Title = "Superstar", Subtitle = "Adidas", Price = 129.99, Description = dummyText, Image = "assets/images/shoes2.png", CategoryName = "Shoes" });
            db.Products.Add(new Product { Title = "Air Force", Subtitle = "Nike", Price = 169.99, Description = dummyText, Image = "assets/images/shoes3.png", CategoryName = "Shoes" });
            db.Products.Add(new Product { Title = "Nike Run", Subtitle = "Nike", Price = 229.99, Description = dummyText, Image = "assets/images/shoes4.png", CategoryName = "Shoes" });
            
            db.Products.Add(new Product { Title = "Jordan Red", Subtitle = "Nike Air Max", Price = 159.99, Description = dummyText, Image = "assets/images/boots1.png", CategoryName = "Boots" });
            db.Products.Add(new Product { Title = "Nike R", Subtitle = "Nike", Price = 99.99, Description = dummyText, Image = "assets/images/boots2.png", CategoryName = "Boots" });
            db.Products.Add(new Product { Title = "Puma Skate", Subtitle = "Puma", Price = 89.99, Description = dummyText, Image = "assets/images/boots3.png", CategoryName = "Boots" });
            db.Products.Add(new Product { Title = "Jordan Gold", Subtitle = "Nike Air Max", Price = 459.99, Description = dummyText, Image = "assets/images/boots4.png", CategoryName = "Boots" });

            db.SaveChanges();
        }

        /// GET shop/Products/{category}
        /// <summary>
        /// Returns products of the selected category.
        /// </summary>
        /// <param name="category">Category name from url</param>
        /// <returns>JSON response with status code</returns>
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
