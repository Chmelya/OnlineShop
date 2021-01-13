import 'dart:convert';

import 'package:online_shop/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductProvider{
  Future<List<Product>> getCategoryProducts(String endPoint) async{
    final response = await http.get("http://10.0.2.2:8000/shop/Products/" + endPoint);

    if(response.statusCode == 200){
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Error download products');
    }
  }
}