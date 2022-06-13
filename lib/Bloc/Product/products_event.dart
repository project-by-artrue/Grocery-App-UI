part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class FectchProduct extends ProductsEvent {}

class ProductCount extends ProductsEvent {
  String id;
  bool? isincrement;
  ProductCount(this.id, {this.isincrement});
}

class GetProductId extends ProductsEvent {
  String productId;
  GetProductId(this.productId);
}

class GetProductToId extends ProductsEvent {}

class FavProduct extends ProductsEvent {
  Product p;
  FavProduct(this.p);
}
