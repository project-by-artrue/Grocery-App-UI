part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ShowProduct extends ProductsState{
   Map<String, Product> product;
   ShowProduct(this.product);
}