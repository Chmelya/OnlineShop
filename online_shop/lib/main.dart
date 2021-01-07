import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop/bloc/product_bloc.dart';
import 'package:online_shop/models/Cart.dart';
import 'package:online_shop/pages/AuthorizationPages/LoginPage.dart';
import 'package:online_shop/services/ProductsRepository.dart';
import 'package:provider/provider.dart';

import 'models/Counters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final productsRepository = ProductsRepository();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(productsRepository: productsRepository),
      child: MultiProvider(
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
        ),
      ),
    );
  }
}