import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/product_bloc.dart';
import 'package:online_shop/bloc/product_event.dart';
import 'package:online_shop/bloc/product_state.dart';
import 'package:online_shop/pages/CatalogPage/components/ProductItem.dart';
import 'package:online_shop/pages/CatalogPage/components/DetailsScreen.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key key, this.endPoint}) : super(key: key);

  final String endPoint;

  @override
  State<StatefulWidget> createState() {
    return new MyState(endPoint);
  }
}

class MyState extends State<CatalogPage> {
  MyState(this.endPoint);

  final String endPoint;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(ProductCategoryClearEvent());
    BlocProvider.of<ProductBloc>(context)
        .add(ProductCategoryLoadEvent(endPoint));
    //loadData();
  }

  // void loadData() async {
  //   try{
  //     String rawData = (await http.get("http://10.0.2.2:8000/shop/Products/" + endPoint)).body;
  //     List<dynamic> jsonData = jsonDecode(rawData);

  //     setState(() {
  //       products = jsonData.map((data) => Product.fromJson(data)).toList();
  //     });
  //   } catch(e){

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                  if (state is ProductCategoryLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ProductCategoryLoadedState) {
                    return GridView.builder(
                        itemCount: state.loadedProducts == null
                            ? 0
                            : state.loadedProducts.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            ProductItem(
                              product: state.loadedProducts[index],
                              press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          product: state.loadedProducts[index],
                                        )),
                              ),
                            ));
                  }
                }
              )
            ),
          ),
        ],
      ),
    );
  }
}
