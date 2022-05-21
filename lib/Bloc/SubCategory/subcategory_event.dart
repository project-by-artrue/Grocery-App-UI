part of 'subcategory_bloc.dart';

@immutable
abstract class SubcategoryEvent {}

class ExploreSelectedCategory extends SubcategoryEvent {
  String categoryId;
  ExploreSelectedCategory(this.categoryId);
}
