class Product{
  final String image, title, description, subtitle;
  final int id;
  final double price;
  Product({
    this.subtitle, 
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> data){
    return Product(
      id: data["id"],
      image: data["image"],
      title: data["title"],
      price: data["price"],
      description: data["description"],
      subtitle: data["subtitle"]
    );
  }
}