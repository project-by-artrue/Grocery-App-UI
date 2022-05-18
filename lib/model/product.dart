// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product(
      {required this.displayImage,
      required this.image,
      required this.title,
      required this.review,
      required this.price,
      required this.marketValue,
      required this.storeId,
      required this.categoryId,
      required this.productId,
      required this.discription});

  String displayImage;
  List<String> image;
  String title;
  List<Review> review;
  String price;
  String marketValue;
  String storeId;
  String categoryId;
  String productId;
  String discription;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        displayImage: json["displayImage"],
        image: List<String>.from(json["image"].map((x) => x)),
        title: json["title"],
        review:
            List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
        price: json["price"],
        marketValue: json["marketValue"],
        storeId: json["storeId"],
        categoryId: json["categoryID"],
        productId: json["productId"],
        discription: json["discription"],
      );

  Map<String, dynamic> toJson() => {
        "displayImage": displayImage,
        "image": List<dynamic>.from(image.map((x) => x)),
        "title": title,
        "review": List<dynamic>.from(review.map((x) => x.toJson())),
        "price": price,
        "marketValue": marketValue,
        "storeId": storeId,
        "categoryID": categoryId,
        "productId": productId,
        "discription": discription,
      };
}

class Review {
  Review({
    required this.name,
    required this.userId,
    required this.comment,
    required this.rating,
    required this.date,
    required this.productId,
    required this.discription,
  });

  String name;
  String userId;
  String comment;
  String rating;
  String date;
  String productId;
  String discription;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
      name: json["name"],
      userId: json["userId"],
      comment: json["comment"],
      rating: json["rating"],
      date: json["date"],
      productId: json["productId"],
      discription: json["discription"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "userId": userId,
        "comment": comment,
        "rating": rating,
        "date": date,
        "productId": productId,
        "discription": discription,
      };
}
