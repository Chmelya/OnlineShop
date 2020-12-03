import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:online_shop/pages/BasePage.dart';
import 'package:online_shop/pages/LoginPage/LoginPage.dart';
import 'package:provider/provider.dart';

import 'models/Counters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        ),
        ChangeNotifierProvider<CounterForCart>(
          create: (context) => CounterForCart(),
        ),
        ChangeNotifierProvider<CounterForCategories>(
          create: (context) => CounterForCategories(),
        ),
      ],
      child: MaterialApp(
        title:'Shop',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: LoginPage(),
        //home: BasePage(),
      ),
    );
  }
}