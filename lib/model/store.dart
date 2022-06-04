// To parserequired this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  Store({
    required this.storeName,
    required this.storeLogo,
    required this.storeImage,
    required this.storeTime,
    required this.storeCloseTime,
    required this.location,
    required this.deliveryTime,
    required this.reating,
    required this.category,
  });

  String storeName;
  String storeLogo;
  String storeImage;
  String storeTime;
  String storeCloseTime;
  String location;
  String deliveryTime;
  List<dynamic> reating;
  List<Category> category;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeName: json["storeName"],
        storeLogo: json["storeLogo"],
        storeImage: json["storeImage"],
        storeTime: json["storeTime"],
        storeCloseTime: json["storeCloseTime"],
        location: json["location"],
        deliveryTime: json["deliveryTime"],
        reating: List<dynamic>.from(json["reating"].map((x) => x)),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "storeName": storeName,
        "storeLogo": storeLogo,
        "storeImage": storeImage,
        "storeTime": storeTime,
        "storeCloseTime": storeCloseTime,
        "location": location,
        "deliveryTime": deliveryTime,
        "reating": List<dynamic>.from(reating.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.categoryId,
    required this.categoryName,
  });

  String categoryId;
  List<CategoryName> categoryName;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["categoryId"],
        categoryName: List<CategoryName>.from(
            json["categoryName"].map((x) => CategoryName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryName": List<dynamic>.from(categoryName.map((x) => x.toJson())),
      };
}

class CategoryName {
  CategoryName({
    required this.subName,
    required this.subId,
  });

  String subName;
  List<String> subId;

  factory CategoryName.fromJson(Map<String, dynamic> json) => CategoryName(
        subName: json["subName"],
        subId: List<String>.from(json["subId"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "subName": subName,
        "subId": List<dynamic>.from(subId.map((x) => x)),
      };
}
