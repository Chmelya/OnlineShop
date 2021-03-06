import 'package:flutter/material.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:online_shop/pages/CartPage/components/CartItemCard.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context){

    final cartData = Provider.of<CartDataProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: cartData.cartItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(cartData.cartItems.values.toList()[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFFFE6E6),
              ),
              child: Row(
                children: [
                  Spacer(),
                  Icon(Icons.delete_sweep_outlined),
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                cartData.deleteItem(cartData.cartItems.keys.toList()[index]);
              });
            },
            child: CartItemCard(cart: cartData.cartItems.values.toList()[index])
          ),
        )
      ),
    );
  }
}