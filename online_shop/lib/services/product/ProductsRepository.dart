import 'package:online_shop/models/Product.dart';
import 'package:online_shop/services/product/ProductProvider.dart';

class ProductsRepository{
  ProductProvider _productProvider = ProductProvider();
  Future<List<Product>> getCategoryProducts(String endPoint) => _productProvider.getCategoryProducts(endPoint);
}