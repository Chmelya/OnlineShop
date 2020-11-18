import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<CartCounter> {
  int _numOfItems = 1;

  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove, 
          press: () {
            if(_numOfItems > 1){
                 setState(() {
                _numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            _numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
          icon: Icons.add, 
          press: () {
            setState(() {
              _numOfItems++;
            });
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}){
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13) 
        ),
        onPressed: press,
        child: Icon(icon),  
      ),
    );
  }
}