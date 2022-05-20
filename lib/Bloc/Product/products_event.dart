part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class FectchProduct extends ProductsEvent {

}
class GetProductId extends ProductsEvent{
  String productId;
  GetProductId(this.productId);
}