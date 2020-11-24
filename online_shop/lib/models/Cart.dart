import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';
import 'Product.dart';

class Cart{
  final Product product;
  final int numOfitems;

  Cart({@required this.product, @required this.numOfitems});
}

class CartDataProvider with ChangeNotifier{
  Map<int, Cart> _cartItems = {
    // 1 : Cart(product: products[0], numOfitems: 2),
    // 2 : Cart(product: products[1], numOfitems: 1),
    // 3 : Cart(product: products[2], numOfitems: 3),
    // 4 : Cart(product: products[3], numOfitems: 2),
    // 5 : Cart(product: products[4], numOfitems: 1),
    // 6 : Cart(product: products[5], numOfitems: 4),
  };

  UnmodifiableMapView<int, Cart> get cartItems => 
    UnmodifiableMapView<int, Cart>(_cartItems);

  double totalAmount(){
    var total = 0.0;
    _cartItems.forEach((key, item) { 
      total += item.product.price * item.numOfitems;
    });      

    return total;
  }

  void addOrUpdateItem(Product product, int amountOfItems){
    if(_cartItems.containsKey(product.id)){
      _cartItems.update(product.id, (ex) => Cart(
        product: ex.product,
        numOfitems: ex.numOfitems + amountOfItems,
      ));
    } else {
      _cartItems.putIfAbsent(product.id, () => Cart(
        product: product, 
        numOfitems: amountOfItems
      ));
    }
    notifyListeners();
  }

  void deleteItem(int id){
    _cartItems.remove(id);
    notifyListeners();
  }

  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }
}