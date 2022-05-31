part of 'store_bloc.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}

class ShowStore extends StoreState {
  Map<String, Store> showStore;
  Map<String, Map<String, List<Product>>> storeProduct;
  ShowStore(this.showStore, this.storeProduct);
}

class FectchStore extends StoreState {}
