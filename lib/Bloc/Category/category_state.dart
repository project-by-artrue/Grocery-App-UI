part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class ShowCategory extends CategoryState {
  List<MainCategories> catedgoryList;

  ShowCategory(this.catedgoryList);
}

class FectchCategory extends CategoryState {}

class ExploarCategory extends CategoryState {
  Map<String, Map<String, List<Product>>> subCategoryMap;
  String catedgoryName;
  ExploarCategory(this.catedgoryName, this.subCategoryMap);
}
