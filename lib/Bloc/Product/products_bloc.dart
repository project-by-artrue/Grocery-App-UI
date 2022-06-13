import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/Bloc/User/user_bloc.dart';
import 'package:grocery/model/product.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final dbReferance = FirebaseFirestore.instance.collection("product");
  Map<String, Product> product = {};
  List<Product> PopularProduct = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, int> count = {};
  UserBloc? userBloc;
  ProductsBloc({this.userBloc}) : super(ProductsInitial()) {
    on<FectchProduct>((event, emit) async {
      // TODO: implement event handler
      emit(FectchPopularProduct());
      final snapshot = dbReferance.snapshots();

      await snapshot.forEach((data) {
        print("}}}}}}}}}}}}${data.docs.length}");
        data.docs.forEach((element) {
          Product p = Product.fromJson(
            element.data(),
          );
          product[p.productId] = p;
          product[p.productId]!.ifFavrite =
              userBloc?.isfav(p.productId) ?? false;
          print("0000000000000000000000000${element.data()}");
        });
        product.forEach((key, value) {
          if (value.isPopular) {
            PopularProduct.add(value);
          }
        });
        emit(ShowProduct(product, count, PopularProduct));
      });
    });

    on<GetProductId>((event, emit) async {
      final snapshot = await dbReferance.doc(event.productId).get();
      Product p = Product.fromJson(snapshot.data()!);
      product[p.productId] = p;
      emit(ShowProduct(product, count, PopularProduct));
    });
    on<ProductCount>((event, emit) {
      // count[event.id] = 1;
      int counts = count[event.id] ?? 1;
      if (event.isincrement != null) {
        if (event.isincrement ?? false) {
          counts++;
          count[event.id] = counts;
        } else {
          counts--;
          count[event.id] = counts;
        }
      } else {
        count[event.id] = counts;
      }
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${count[event.id]}");
      emit(ShowProduct(product, count, PopularProduct));
    });
    on<GetProductToId>(
      (event, emit) {
        emit(ShowProduct(product, count, PopularProduct));
      },
    );
    on<FavProduct>((event, emit) async {
      List fav = userBloc!.getfav();
      if (event.p.ifFavrite) {
        fav.remove(event.p.productId);
        event.p.ifFavrite = false;
      } else {
        fav.add(event.p.productId);
        event.p.ifFavrite = true;
        print("kkkkkk");
      }

      await firestore
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"Favorite product": fav}).then((value) {});
      print("99999999999999999999999${fav}");
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

  void favproducts(String id) {
    print("<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>${id}");
    product[id]?.ifFavrite = true;
    print("ooooooooooooooooooo${product[id]?.title}");
    print("++++++++++++++++++${product[id]?.ifFavrite}");
  }
}
