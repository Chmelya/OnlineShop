import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:online_shop/models/Cart.dart';
import 'package:provider/provider.dart';
class CartProvider {
  void sendOrder(var context) async {
    try 
    {
      http.Response response = await http.post(
          "http://10.0.2.2:8000/shop/Orders/SendOrder",
          body: jsonEncode(Provider.of<CartDataProvider>(context).toJsonForApi()),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        Provider.of<CartDataProvider>(context, listen: false).clearCart();
      }
    } catch (e) {}
  }
}
