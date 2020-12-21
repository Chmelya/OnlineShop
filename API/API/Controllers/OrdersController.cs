using Microsoft.AspNetCore.Mvc;
using API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    /// <summary>
    /// Provides information about orders.
    /// </summary>
    [ApiController]
    [Route("shop/[controller]")]
    public class OrdersController : Controller
    {
        OrderContext dbOrder;
        UserContext dbUser;

        /// <summary>
        ///Initialize controller.
        /// </summary>
        /// <param name="orderContext">Intialize database context of orders.</param> 
        /// <param name="userContext">Intialize database context of users.</param> 
        public OrdersController(OrderContext orderContext, UserContext userContext)
        {
            dbOrder = orderContext;
            dbUser = userContext;
        }

        /// POST shop/Purchases
        /// <summary>
        /// Save order.
        /// </summary>
        /// <param name="order">Order model from request body</param>
        /// <returns>Status code</returns>
        [HttpPost]
        [Route("SendOrder")]
        public ActionResult SaveOreder(Order order)
        {
            if(ModelState.IsValid)
            {
                Order newOrder = new Order()
                {
                    UserId = order.UserId,
                    UserName = dbUser.Users.Find(order.UserId).Name
                };

                dbOrder.Orders.Add(newOrder);

                foreach(var purchase in order.Purchases)
                {
                    dbOrder.Purchases.Add(new Purchase()
                    {
                        ProductId = purchase.ProductId,
                        Amount = purchase.Amount,
                        ProductName = purchase.ProductName,
                        Order = newOrder,
                    });
                }

                dbOrder.SaveChanges();

                return Ok();
            }

            return BadRequest();
        }

    }
}
