import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/pages/components/AddToCart.dart';
import 'package:online_shop/pages/components/CartCounter.dart';
import 'package:online_shop/pages/components/ProductTileWithImage.dart';

class Body extends StatelessWidget{
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3 + 50),
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 60,
                          ),
                          child: Text(  
                            product.description,
                            style: TextStyle(height: 1.5),
                          ),
                        ),
                        CartCounter(),
                        AddToCart(),
                      ],
                    ),
                  ),
                ),
                ProductTileWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}