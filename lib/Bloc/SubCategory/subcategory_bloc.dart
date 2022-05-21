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
        final snapshot = await dbReferance.doc(event.categoryId).get();
        MainCategories category =
            MainCategories.fromJson(snapshot.data() ?? {});
        String catId = event.categoryId;
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
            "categoriesMap[event.categoryId]!.categoryName", subCategoryMap));
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
