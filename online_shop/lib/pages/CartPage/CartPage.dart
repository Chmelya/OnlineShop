import 'package:flutter/material.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:online_shop/pages/CartPage/components/Body.dart';
import 'package:online_shop/pages/CartPage/components/CheckCart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){

  final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), 
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Column(
            children: [
              Text(
                "Your Cart",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "${cartData.cartItems.length} items",
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