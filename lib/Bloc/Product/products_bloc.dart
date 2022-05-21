import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/product.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final dbReferance = FirebaseFirestore.instance.collection("product");
  Map<String, Product> product = {};
  ProductsBloc() : super(ProductsInitial()) {
    on<FectchProduct>((event, emit) async {
      // TODO: implement event handler

      Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
          dbReferance.snapshots();
      await snapshot.forEach((data) {
        data.docs.forEach((element) {
          Product p = Product.fromJson(
            element.data(),
          );
          product[p.productId] = p;
        });
      });
      emit(ShowProduct(product));
    });
    on<GetProductId>((event, emit) async {
      final snapshot = await dbReferance.doc(event.productId).get();
      Product p = Product.fromJson(snapshot.data()!);
      product[p.productId] = p;
      emit(ShowProduct(product));
    });
  }

  bool isProductAvailable(String id) {
    return product.containsKey(id);
  }

  Product? getProduct(String id) {
    return product[id];
  }

  Future<Product> fetchProduct(String id) async {
    final snapshot = await dbReferance.doc(id).get();
    Product p = Product.fromJson(snapshot.data()!);
    product[p.productId] = p;
    return p;
  }
}
