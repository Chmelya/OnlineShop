import 'package:flutter/material.dart';
import 'package:online_shop/pages/CartPage/CartPage.dart';
import 'package:online_shop/pages/CatalogPage/CatalogPage.dart';

class BasePage extends StatefulWidget{
  @override
  _BaseState createState() => _BaseState(); 
}

class _BaseState extends State<BasePage>
{
  //int _currentIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: buildAppBar(context),
      body: CatalogPage(), //tabs[_currentIndex],
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back),
      //   color: Colors.black, 
      //   onPressed: () {},
      // ),
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
        IconButton(
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 10),
      ],
    );
  }
}