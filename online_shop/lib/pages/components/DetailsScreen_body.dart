import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';

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
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                Padding( 
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Beautiful Hand bag",
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
                      Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(text: "Price\n"),
                              TextSpan(
                                text: "\$${product.price}",
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
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}