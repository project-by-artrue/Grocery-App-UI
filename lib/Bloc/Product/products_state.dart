part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ShowProduct extends ProductsState {
  Map<String, Product> product;
  Map<String, int> count;
  List<Product> popularProduct;
  ShowProduct(this.product, this.count, this.popularProduct);
}

class FectchPopularProduct extends ProductsState {}
