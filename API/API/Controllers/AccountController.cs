using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using API.Models;

namespace API.Controllers
{
    [Route("shop/[controller]")]
    [ApiController]
    public class AccountController : Controller
    {
        UserContext db;
        public AccountController(UserContext context)
        {
            db = context;
        }

        //POST shop/Account/Login
        [HttpPost]
        [Route("Login")]
        public ActionResult Login(User model)
        {
            if (ModelState.IsValid)
            {
                User user = null;
                user = db.Users.FirstOrDefault(u => u.Name == model.Name.Trim() && u.Password == model.Password.Trim());

                if (user != null)
                    return Json(user.Id);

                return BadRequest();
            }
            
            return BadRequest();
        }

        //POST api/Account/Registration
        [HttpPost]
        [Route("Registration")]
        public ActionResult Registration(User model)
        {
            if (ModelState.IsValid)
            {
                User user = null;
                user = db.Users.FirstOrDefault(u => u.Name == model.Name.Trim());

                if (user == null)
                {

                    db.Users.Add(new User { Name = model.Name.Trim(), Password = model.Password.Trim() });
                    db.SaveChanges();

                    user = db.Users.Where(u => u.Name == model.Name && u.Password == model.Password).FirstOrDefault();

                    if (user != null)
                    {
                        return Ok();
                    }
                }

                return BadRequest();

            }

            return BadRequest();
        }
    }
}
