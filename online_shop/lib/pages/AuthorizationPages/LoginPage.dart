import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/StaticData.dart';
import '../BasePage.dart';
import 'RegistrationPage.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final loginTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();

  @override
  void dispose() {
    loginTextFieldController.dispose();
    passwordTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
      return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle> (
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.cyan
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 120
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        buildLoginTextField(),
                        SizedBox(height: 30),
                        buildPasswordTextField(),
                        buildLoginButton(),
                        SizedBox(height: 10), 
                        buildSignUp()
                      ],
                    ),
                  ),
                ),
              ],
          ),
            ),
        ),
      );
  }

  Widget buildSignUp() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => RegistrationPage())
        );
      },
      child: RichText(
        text: TextSpan(
          children:[
            TextSpan(
              text: "Don\'t have an Account? ", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              )
            ),
            TextSpan(
              text: "Sign Up", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
            )
          ] 
        )  
      ),
    );
  }

  Widget buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async{
          http.Response response = await http.post(
            "http://10.0.2.2:8000/shop/Account/Login",
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "name": loginTextFieldController.text.trim(),
              "password": passwordTextFieldController.text.trim()
            }), 
          );

          StaticData.userId = response.body;
          
          if(response.statusCode == 200){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BasePage()),
              (r) => false
            );
          }

        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.cyan,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget buildPasswordTextField() {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       Text(
         "Password",
         style: TextStyle(
           color: Colors.white, 
           fontWeight: FontWeight.bold
         ),
       ),
       Container(
         alignment: Alignment.centerLeft,
         height: 60,
         child: TextField(
           obscureText: true, 
           keyboardType: TextInputType.text,
           controller: passwordTextFieldController,
           style: TextStyle(
             color: Colors.white,
             fontSize: 15,
           ),
           decoration: InputDecoration(
             contentPadding: EdgeInsets.only(top: 12),
             prefixIcon: Icon(
               Icons.lock_rounded,
               color: Colors.white
             ),
             hintText: "Enter your password",
             hintStyle: TextStyle(
               color: Colors.white,
               fontSize: 15,
             )
           ),
         ),
       )
     ],
   );
  }

  Widget buildLoginTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Login",
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          child: TextField( 
            keyboardType: TextInputType.text,
            controller: loginTextFieldController,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 12),
              prefixIcon: Icon(
                Icons.account_box_rounded,
                color: Colors.white
              ),
              hintText: "Enter your login",
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
              )
            ),
          ),
        )
      ],
    );
  }

}