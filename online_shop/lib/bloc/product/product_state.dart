import 'package:flutter/foundation.dart';

abstract class ProductState{}

class ProductCategoryEmptyState extends ProductState {}

class ProductCategoryLoadingState extends ProductState {}

class ProductCategoryLoadedState extends ProductState {
  List<dynamic> loadedProducts;
  ProductCategoryLoadedState({@required this.loadedProducts}) : assert (loadedProducts != null);
}

class ProductCategoryErrorState extends ProductState {}