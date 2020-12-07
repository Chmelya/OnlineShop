import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../StaticData.dart';

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
                onPressed: () async {
                  // List<Map <String, dynamic> > purchasesListForApi(){
                  //   List<Map <String, dynamic>> list = [];

                  //   cartData.cartItems.forEach((key, value) {
                  //     list.add(value.toJsonForApi());
                  //   });

                  //   return list;
                  // }

                  // Map<String, dynamic> toJsonForApi() =>{
                  //   'userid' : StaticData.userId,
                  //   'purchases': jsonEncode(purchasesListForApi())
                  // }; 

                  http.Response response = await http.post(
                    "http://10.0.2.2:8000/shop/Orders/SendOrder",
                    body: jsonEncode(cartData.toJsonForApi()), 
                    headers: {"Content-Type": "application/json"}
                  );

                  if(response.statusCode == 200){
                    Provider.of<CartDataProvider>(context, listen: false).clearCart();
                  }
                },
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