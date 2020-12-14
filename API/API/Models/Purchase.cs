using System.ComponentModel.DataAnnotations;

namespace API.Models
{
    public class Purchase
    {
        [Key]
        public int PurchaseId { get; set; }
        public int ProductId { get; set; }
        public int Amount { get; set; }
        public string ProductName { get; set; }
        public Order Order { get; set; }
        public int OrderID { get; set; }
    }
}
