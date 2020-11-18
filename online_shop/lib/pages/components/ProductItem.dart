import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function press;
  const ProductItem({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              product.title,
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Text(
            "\$${product.price}",
             style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
          ),
        ],
      ),
    );
  }
}