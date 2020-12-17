import 'package:flutter/material.dart';
import 'package:online_shop/models/Counters.dart';
import 'package:online_shop/pages/CartPage/CartPage.dart';
import 'package:online_shop/pages/CatalogPage/CatalogPage.dart';
import 'package:provider/provider.dart';
import 'CatalogPage/components/Categories.dart';

class BasePage extends StatefulWidget{
  @override
  _BaseState createState() => _BaseState(); 
}

class _BaseState extends State<BasePage>
{
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context){
    final _currentIndex = Provider.of<CounterForCategories>(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Categories(pageController: pageController),
          Expanded(
              child: PageView(
              pageSnapping: true,
              controller: pageController,
              onPageChanged: (index){
                _currentIndex.setValue = index;
              },
              children: [
                CatalogPage(endPoint: "Sneakers"),
                CatalogPage(endPoint: "Sliders"),
                CatalogPage(endPoint: "Shoes"),
                CatalogPage(endPoint: "Boots"), 
              ],
            ),
          ),
        ],
      ), 
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Shop",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()), 
          ),
        ),
        // IconButton(
        //   icon: Icon(
        //     Icons.account_circle_outlined,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {},
        // ),
        SizedBox(width: 10),
      ],
    );
  }
}