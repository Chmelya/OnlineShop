import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/pages/CatalogPage/components/ProductItem.dart';
import 'package:online_shop/pages/CatalogPage/components/DetailsScreen.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key key, this.endPoint}) : super(key: key);

  final String endPoint;

  @override
  State<StatefulWidget> createState() {
    return new MyState(endPoint);
  }
}

class MyState extends State<CatalogPage> {  
  MyState(this.endPoint); 

  List<Product> products;
  final String endPoint;

  @override
  void initState() {
    super.initState();
    loadData();
  }
 
  void loadData() async {
    String rawData = (await http.get("http://10.0.2.2:8000/shop/Products/" + endPoint)).body;
    List<dynamic> jsonData = jsonDecode(rawData);
    
    setState(() {
      products = jsonData.map((data) => Product.fromJson(data)).toList();
    }); 
    
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: products == null ? 0 : products.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) => ProductItem(
                  product: products[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        product: products[index],
                      )
                    ), 
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}