part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class GetCategory extends CategoryEvent {
  GetCategory();
}

class ExploreSelectedCategory extends CategoryEvent {
  String categoryId;
  ExploreSelectedCategory(this.categoryId);
}
