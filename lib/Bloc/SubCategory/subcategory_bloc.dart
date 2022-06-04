import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/model/categories.dart';
import 'package:grocery/model/product.dart';
import 'package:meta/meta.dart';

part 'subcategory_event.dart';
part 'subcategory_state.dart';

class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  final dbReferance = FirebaseFirestore.instance.collection("category");
  final ProductsBloc productBloc;
  Map<String, MainCategories> categoriesMap = {};
  Map<String, Map<String, List<Product>>> subCategoryMap = {};

  SubcategoryBloc(this.productBloc) : super(SubcategoryInitial()) {
    on<ExploreSelectedCategory>((event, emit) async {
      if (!subCategoryMap.containsKey(event.categoryId)) {
        emit(FectchCategory());
        // fetch data for given category
        final snapshot = await dbReferance.doc(event.categoryId).get();
        MainCategories category =
            MainCategories.fromJson(snapshot.data() ?? {});

        String catId = event.categoryId;
        subCategoryMap[catId] = {};

        // create map for it
        for (int i = 0; i < category.subCategory.length; i++) {
          List<String> list = category.subCategory[i].subCategoryProductId;
          String subId = category.subCategory[i].subCategoryName;

          for (int j = 0; j < list.length; j++) {
            if (productBloc.isProductAvailable(list[j])) {
              Product? p = productBloc.getProduct(list[j]);
              if (p != null) addItemToMap(catId, subId, p);
            } else {
              await productBloc.fetchProduct(list[j]);
              Product? p = productBloc.getProduct(list[j]);
              if (p != null) addItemToMap(catId, subId, p);
            }
          }
          emit(ExploarCategory(category.categoryName, subCategoryMap));
        }
      } else {
        emit(ExploarCategory(
            "categoriesMap[event.categoryId]!.categoryName", subCategoryMap));
      }
    });
  }

  addItemToMap(String mainCategoryId, String subCategoryId, Product product) {
    subCategoryMap.putIfAbsent(mainCategoryId, (() => {}));
    subCategoryMap[mainCategoryId]!.putIfAbsent(subCategoryId, (() => []));

    subCategoryMap[mainCategoryId]![subCategoryId]!.add(product);
  }
}
