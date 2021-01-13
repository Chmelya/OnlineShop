import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/services/authorization/AuthorizationProvider.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final loginTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final confirmPasswordTextFieldController = TextEditingController();

  @override
  void dispose() {
    loginTextFieldController.dispose();
    passwordTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.cyan),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign Up",
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
                      SizedBox(height: 30),
                      buildConfirmPasswordTextField(),
                      buildConfirmButton(),
                      SizedBox(height: 10),
                      buildSignIn()
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

  Widget buildConfirmButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async{
          if (await AuthorizationProvider().userRegistration(
                  loginTextFieldController.text.trim(),
                  passwordTextFieldController.text.trim(),
                  confirmPasswordTextFieldController.text.trim()) ==
              true) {
            Navigator.pop(context);
          }
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: Text(
          "CONFIRM",
          style: TextStyle(
            color: Colors.cyan,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget buildConfirmPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Confirm password",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            controller: confirmPasswordTextFieldController,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 12),
                prefixIcon: Icon(Icons.lock_rounded, color: Colors.white),
                hintText: "Repeat your password",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
          ),
        )
      ],
    );
  }

  Widget buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                prefixIcon: Icon(Icons.lock_open_rounded, color: Colors.white),
                hintText: "Enter your password",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                prefixIcon:
                    Icon(Icons.account_box_rounded, color: Colors.white),
                hintText: "Enter your login",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
          ),
        )
      ],
    );
  }

  Widget buildSignIn() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            )),
        TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ))
      ])),
    );
  }
}
