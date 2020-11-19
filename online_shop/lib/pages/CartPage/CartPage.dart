import 'package:flutter/material.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:online_shop/pages/CartPage/components/Body.dart';
import 'package:online_shop/pages/CartPage/components/CheckCart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Column(
            children: [
              Text(
                "You Cart",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "${cart.length} items", //Добавить событие
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CheckCart()
    );
  }
}