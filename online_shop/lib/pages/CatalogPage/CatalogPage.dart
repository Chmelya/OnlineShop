import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/pages/CatalogPage/components/ProductItem.dart';
import 'package:online_shop/pages/CatalogPage/components/Categories.dart';
import 'package:online_shop/pages/CatalogPage/components/DetailsScreen.dart';

class CatalogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyState();
  }
}

class MyState extends State<CatalogPage> {  
  
  List questions;
  String endpoint = "https://api.stackexchange.com/2.2/questions?" +
  "pagesize=100&order=desc&sort=activity&site=stackoverflow";

  @override
  void initState() {
    super.initState();
    loadData();
  }
 
  void loadData() async {
    // More code here
    //String rawData = (await http.get(endpoint)).body;
    //Map jsonData = jsonDecode(rawData);
    
    setState(() {
      //questions = jsonData["items"];
    }); 
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Categories(),
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