using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using API.Models;

namespace API.Controllers
{
    /// <summary>
    /// Provides information about users.
    /// </summary>
    [Route("shop/[controller]")]
    [ApiController]
    public class AccountController : Controller
    {
        UserContext db;
        /// <summary>
        /// Initialize controller.
        /// </summary>
        /// <param name="userContext">Intialize database context of users.</param> 
        public AccountController(UserContext context)
        {
            db = context;
        }

        /// POST shop/Account/Login
        /// <summary>
        /// Check information about user if he exist.
        /// </summary>
        /// <param name="model">User model from request body</param>
        /// <returns>Status code</returns>
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

        /// POST api/Account/Registration
        /// <summary>
        /// Save information about new user.
        /// </summary>
        /// <param name="model">User model from request body</param>
        /// <returns>Status code</returns>
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
