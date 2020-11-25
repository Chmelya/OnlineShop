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
        public ProductsController(CategoryContext context)
        {
            db = context;
        }

        // GET shop/products/catiegory
        [HttpGet("{category}")]
        public ActionResult GetCategoryProducts(string category)
        {
            Response.Headers.Add("Content-Type", "application/json");

            //скорее всего поиск так не сработает
            var response = db.Categories.Find(category).Products;
            if(response != null)
                return Json(response);

            return BadRequest();
        }   
    }
}
