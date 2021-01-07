abstract class ProductEvent {}

class ProductCategoryLoadEvent extends ProductEvent {
  final String endPoint;
  ProductCategoryLoadEvent(this.endPoint);
}

class ProductCategoryClearEvent extends ProductEvent {}