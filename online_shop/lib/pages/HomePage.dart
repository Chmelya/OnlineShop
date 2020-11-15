import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState(); 
}

class _HomeState extends State<HomePage>
{
  int _currentIndex = 0;

  //окна
  final tabs = [
    SafeArea(child: Text('Home')),
    SafeArea(child: Text('Search')),
    SafeArea(child: Text('Cart')),
    SafeArea(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: buildAppBar(),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Catalog',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
            backgroundColor: Colors.indigo,
          ),
        ],
        onTap: (index){
          setState((){
            _currentIndex = index;
          });
        }
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: new Text("Shop"),
        actions: <Widget>[
          //конпки поиска и корзины
        ],
    );
  }
}