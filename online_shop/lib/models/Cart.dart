import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/StaticData.dart';
import 'package:online_shop/models/Product.dart';
import 'Product.dart';

class Cart{
  final Product product;
  final int amount;

  Cart({@required this.product, @required this.amount});
  
  Map<String, dynamic> toJsonForApi() => {
    'productid': product.id,
    'productname' : product.title,
    'amount': amount,
  };
}

class CartDataProvider with ChangeNotifier{
  Map<int, Cart> _cartItems = {};

  UnmodifiableMapView<int, Cart> get cartItems => 
    UnmodifiableMapView<int, Cart>(_cartItems);

  List<Map <String, dynamic> > purchasesListForApi(){
    List<Map <String, dynamic>> list = [];
    
    cartItems.forEach((key, value) {
      list.add(value.toJsonForApi());
    });

    return list;
  }

  Map<String, dynamic> toJsonForApi() =>{
    'userid' : StaticData.userId,
    'purchases': purchasesListForApi()
  };

  double totalAmount(){
    var total = 0.0;
    _cartItems.forEach((key, item) { 
      total += item.product.price * item.amount;
    });      

    return total;
  }

  void addOrUpdateItem(Product product, int amountOfItems){
    if(_cartItems.containsKey(product.id)){
      _cartItems.update(product.id, (ex) => Cart(
        product: ex.product,
        amount: ex.amount + amountOfItems,
      ));
    } else {
      _cartItems.putIfAbsent(product.id, () => Cart(
        product: product, 
        amount: amountOfItems
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