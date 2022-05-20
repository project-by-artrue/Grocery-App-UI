// To parse this JSON data, do
//
//     final categoris = categorisFromJson(jsonString);

import 'dart:convert';

MainCategories categorisFromJson(String str) =>
    MainCategories.fromJson(json.decode(str));

String categorisToJson(MainCategories data) => json.encode(data.toJson());

class MainCategories {
  MainCategories({
    required this.image,
    required this.categoryName,
    required this.categoryId,
    required this.subCategory,
  });

  String image;
  String categoryName;
  String categoryId;
  List<SubCategory> subCategory;

  factory MainCategories.fromJson(Map<String, dynamic> json) => MainCategories(
        image: json["image"],
        categoryName: json["categoryName"],
        categoryId: json['categoryId'],
        subCategory: List<SubCategory>.from(
            json["subCategory"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "categoryName": categoryName,
        "categoryId": categoryId,
        "subCategory": List<dynamic>.from(subCategory.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    required this.subCategoryName,
    required this.subCategoryProductId,
  });

  String subCategoryName;
  List<String> subCategoryProductId;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        subCategoryName: json["subCategoryName"],
        subCategoryProductId:
            List<String>.from(json["subCategoryProductId"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "subCategoryName": subCategoryName,
        "subCategoryProductId":
            List<dynamic>.from(subCategoryProductId.map((x) => x)),
      };
}
