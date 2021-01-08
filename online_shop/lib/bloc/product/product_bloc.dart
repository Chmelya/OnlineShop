import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/product/product_event.dart';
import 'package:online_shop/bloc/product/product_state.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/services/ProductsRepository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepository productsRepository;

  ProductBloc({@required this.productsRepository})
      : super(ProductCategoryEmptyState());

  // @override
  // ProductState get initialState => ProductCategoryEmptyState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductCategoryLoadEvent) {
      yield ProductCategoryLoadingState();
      try {
        final List<Product> _loadedProductList =
            await productsRepository.getCategoryProducts(event.endPoint);
        yield ProductCategoryLoadedState(loadedProducts: _loadedProductList);
      } catch (_) {
        yield ProductCategoryEmptyState();
      }
    } else if (event is ProductCategoryClearEvent) {
      yield ProductCategoryEmptyState();
    }
  }
}
