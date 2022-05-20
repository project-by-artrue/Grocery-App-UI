// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/Bloc/Slider/slider_bloc.dart';
import 'package:grocery/model/Categories.dart';
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
          data.docs.forEach(
            (element) {
              MainCategories category = MainCategories.fromJson(element.data());
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

    on<ExploreSelectedCategory>((event, emit) async {
      if (!subCategoryMap.containsKey(event.categoryId)) {
        emit(FectchCategory());
        print("sssssssssssssssssssssss${event.categoryId}");
        final snapshot = await dbReferance.doc(event.categoryId).get();
        MainCategories category =
            MainCategories.fromJson(snapshot.data() ?? {});
        String catId = event.categoryId;
        print(category.categoryName);
        subCategoryMap[catId] = {};
        for (int i = 0; i < category.subCategory.length; i++) {
          List<String> list = category.subCategory[i].subCategoryProductId;
          String subId = category.subCategory[i].subCategoryName;
          subCategoryMap[catId]![subId] = [];
          for (int j = 0; j < list.length; j++) {
            if (productBloc.isProductAvailable(list[j])) {
              subCategoryMap[catId]![subId]!
                  .add(productBloc.getProduct(list[j])!);
            } else {
              await productBloc.fetchProduct(list[j]);
              subCategoryMap[catId]![subId]!
                  .add(productBloc.getProduct(list[j])!);
            }
          }
          emit(ExploarCategory(category.categoryName, subCategoryMap));
        }
      } else {
        emit(ExploarCategory(
            categoriesMap[event.categoryId]!.categoryName, subCategoryMap));
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
    // subCategoryMap.addAll({cName:sName})
    subCategoryMap[cName]![sName]!.add(p);
    // print("777777777777${subCategoryMap}777777777${p.productId}");
  }
}
