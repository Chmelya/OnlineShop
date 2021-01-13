import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../StaticData.dart';

class AuthorizationProvider {
  Future<bool> userAuthentication(String login, String password) async {
    try {
      http.Response response = await http.post(
        "http://10.0.2.2:8000/shop/Account/Login",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"name": login, "password": password}),
      );

      if (response.statusCode == 200) {
        StaticData.userId = response.body;
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> userRegistration(
      String login, String password, String confirmPassword) async {
    if (password == confirmPassword) {
      try {
        http.Response response = await http.post(
          "http://10.0.2.2:8000/shop/Account/Registration",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body:
              jsonEncode(<String, String>{"name": login, "password": password}),
        );

        if (response.statusCode == 200) {
          return true;
        }

        return false;
      } catch (e) {
        return false;
      }
    }
  }
}
