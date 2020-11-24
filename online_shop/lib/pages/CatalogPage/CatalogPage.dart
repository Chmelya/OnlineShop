import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/pages/CatalogPage/components/ProductItem.dart';
import 'package:online_shop/pages/CatalogPage/components/Categories.dart';
import 'package:online_shop/pages/CatalogPage/components/DetailsScreen.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key key, this.url}) : super(key: key);

  final String url;

  @override
  State<StatefulWidget> createState() {
    return new MyState(url);
  }
}

class MyState extends State<CatalogPage> {  
  Product product;
  final String url;

  MyState(this.url); 

  @override
  void initState() {
    super.initState();
    //loadData();
  }
 
  void loadData() async {
    String rawData = (await http.get(url)).body;
    Map jsonData = jsonDecode(rawData);
    
    setState(() {
      products = jsonData["items"];
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