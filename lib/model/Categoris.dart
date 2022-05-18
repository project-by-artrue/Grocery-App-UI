// To parse this JSON data, do
//
//     final categoris = categorisFromJson(jsonString);

import 'dart:convert';

Categoris categorisFromJson(String str) => Categoris.fromJson(json.decode(str));

String categorisToJson(Categoris data) => json.encode(data.toJson());

class Categoris {
  Categoris({
    required this.image,
    required this.categoryName,
    required this.subCategory,
  });

  String image;
  String categoryName;
  List<SubCategory> subCategory;

  factory Categoris.fromJson(Map<String, dynamic> json) => Categoris(
        image: json["image"],
        categoryName: json["categoryName"],
        subCategory: List<SubCategory>.from(
            json["subCategory"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "categoryName": categoryName,
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
