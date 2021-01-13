import 'package:flutter/material.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:online_shop/services/cart/CartProvider.dart';
import 'package:provider/provider.dart';

class CheckCart extends StatelessWidget {
  const CheckCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
  
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [BoxShadow(
          offset: Offset(0, -15),
          blurRadius: 20,
          color: Color(0xFFDADADA).withOpacity(0.15),
        )],
      ),
      child: SafeArea(
          child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "Total:\n",
                children: [
                  TextSpan(
                    text: "${cartData.totalAmount().toStringAsFixed(2)}", 
                    style: TextStyle(fontSize: 16, color: Colors.black), 
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.cyan,
                onPressed: () => CartProvider().sendOrder(context),
                child: Text(
                  "Check out", 
                  style: TextStyle(color: Colors.white),
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}