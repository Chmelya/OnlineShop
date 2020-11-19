import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';
import 'Product.dart';

class Cart {
  final Product product;
  final int numOfitems;

  Cart({@required this.product, @required this.numOfitems});

}

//double sum;
double cartSum(List<Cart> cart){
  double sum = 0.0;

  for(int i = 0; i < cart.length; i++){
    sum += cart[i].product.price * cart[i].numOfitems;
  }

  return sum;
}

List<Cart> cart = [
  Cart(product: products[0], numOfitems: 2),
  Cart(product: products[1], numOfitems: 1),
  Cart(product: products[2], numOfitems: 3),
  Cart(product: products[3], numOfitems: 2),
  Cart(product: products[4], numOfitems: 1),
  Cart(product: products[5], numOfitems: 4),
];