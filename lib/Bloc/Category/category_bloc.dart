// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/Bloc/Slider/slider_bloc.dart';
import 'package:grocery/model/categories.dart';
import 'package:grocery/model/product.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  List<MainCategories> catedgoryList = [];
  final dbReferance = FirebaseFirestore.instance.collection("category");
  final ProductsBloc productBloc;
  Map<String, Map<String, List<Product>>> subCategoryMap = {};
  Map<String, MainCategories> categoriesMap = {};

  CategoryBloc(this.productBloc) : super(CategoryInitial()) {
    on<GetCategory>((event, emit) async {
      // TODO: implement event handler
      if (catedgoryList.isEmpty) {
        emit(FectchCategory());
        final snapshot = dbReferance.snapshots();
        await snapshot.forEach((data) {
          print(data.docs.length.toString() +
              "  ffffffffffffffffffffffffffffffffffffffffffffff");
          data.docs.forEach(
            (element) {
              MainCategories category = MainCategories.fromJson(element.data());
              print("lllllllllllllllllll${category.toJson()}");
              catedgoryList.add(category);
              categoriesMap[category.categoryId] = category;
            },
          );
          emit(ShowCategory(catedgoryList));
        });
      } else {
        emit(ShowCategory(catedgoryList));
      }
    });

  
  }

  void addProductToMap(String cName, String sName, Product p) {
    if (!subCategoryMap.containsKey(cName)) {
      subCategoryMap = {cName: {}};
    }
    if (!subCategoryMap[cName]!.containsKey(sName)) {
      subCategoryMap = {
        cName: {sName: []}
      };
    }
    subCategoryMap[cName]![sName]!.add(p);
  }
}
