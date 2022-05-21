part of 'subcategory_bloc.dart';

@immutable
abstract class SubcategoryState {}

class SubcategoryInitial extends SubcategoryState {}
class FectchCategory extends SubcategoryState {}

class ExploarCategory extends SubcategoryState {
  Map<String, Map<String, List<Product>>> subCategoryMap;
  String catedgoryName;
  ExploarCategory(this.catedgoryName, this.subCategoryMap);
}
