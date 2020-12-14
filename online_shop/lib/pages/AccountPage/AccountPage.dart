import 'package:flutter/material.dart';
import 'package:online_shop/pages/AuthorizationPages/LoginPage.dart';

class AccountPage extends StatefulWidget{
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.3),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.4),
                  buildChangePasswordButton(),
                  buildQuitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChangePasswordButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: SizedBox(
        width: 350,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.cyan,
          onPressed: () {
            
          },
          child: Text(
            "Change Password", 
            style: TextStyle(color: Colors.white),
          ),
        ), 
      ),
    );
  }

  Widget buildQuitButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: SizedBox(
        width: 350,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.red,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (r) => false
              );
          },
          child: Text(
            "Quit", 
            style: TextStyle(color: Colors.red),
          ),
        ), 
      ),
    );
  }
}