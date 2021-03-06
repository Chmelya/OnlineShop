import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';

class ProductTileWithImage extends StatelessWidget {
  const ProductTileWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${product.subtitle}",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Price\n"),
                  TextSpan(
                    text: "\$${product.price.toStringAsFixed(2)}",
                    style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ), 
                  ),
                ])
              ),
              SizedBox(width: 20),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}