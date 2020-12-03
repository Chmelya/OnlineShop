using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    [ApiController]
    [Route("shop/[controller]")]
    public class PurchasesController : Controller
    {
        public PurchasesController()
        {

        }

        //POST shop/Purchases/{userId}
        [HttpPost("{userId}")]
        public ActionResult SavePurchasesList(int userId)
        {
            return Ok();
        }

    }
}
