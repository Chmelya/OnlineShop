import 'package:flutter/material.dart';
import 'package:online_shop/pages/CartPage/CartPage.dart';
import 'package:online_shop/pages/CatalogPage/CatalogPage.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/pages/CatalogPage/components/ProductItem.dart';

class BasePage extends StatefulWidget{
  @override
  _BaseState createState() => _BaseState(); 
}

class _BaseState extends State<BasePage>
{
  int _currentIndex = 0;

  //окна
  final tabs = [
    SafeArea(child: Center(child: Text('Home'))),
    CatalogPage(),
    SafeArea(child: Center(child: Text('Cart'))),
    SafeArea(child: Center(child: Text('Profile'))),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //appBar: buildAppBar(),
      body: CartPage(), //tabs[_currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   type: BottomNavigationBarType.shifting,
      //   selectedFontSize: 15,
      //   unselectedFontSize: 10,
      //   iconSize: 25,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Colors.indigo,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Catalog',
      //       backgroundColor: Colors.indigo,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //       backgroundColor: Colors.indigo,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_box),
      //       label: 'Profile',
      //       backgroundColor: Colors.indigo,
      //     ),
      //   ],
      //   onTap: (index){
      //     setState((){
      //       _currentIndex = index;
      //     });
      //   }
      // ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back), 
        onPressed: () {},
      ),
      title: new Text("Shop"),
    );
  }
}