import 'package:flutter/material.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/pages/CatalogPage/components/DetailsScreen_body.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget{
  final Product product;

  const DetailScreen({Key key, this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.cyan, //доавить цвет товару
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.cyan,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back), 
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}