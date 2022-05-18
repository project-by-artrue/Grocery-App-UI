// To parse this JSON data, do
//
//     final userfilld = userfilldFromJson(jsonString);

import 'dart:convert';

Userfilld userfilldFromJson(String str) => Userfilld.fromJson(json.decode(str));

String userfilldToJson(Userfilld data) => json.encode(data.toJson());

class Userfilld {
  Userfilld({
    required this.firstName,
    required this.lastName,
    required this.mobileName,
    required this.lastSignedIn,
    required this.mobileNumber,
    required this.addToCart,
    required this.deviceHardware,
    required this.favourite,
    required this.order,
  });

  String firstName;
  String lastName;
  String mobileName;
  String lastSignedIn;
  String mobileNumber;
  List<AddToCart> addToCart;
  String deviceHardware;
  List<String> favourite;
  List<Order> order;

  factory Userfilld.fromJson(Map<String, dynamic> json) => Userfilld(
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileName: json["mobileName"],
        lastSignedIn: json["lastSignedIn"],
        mobileNumber: json["mobileNumber"],
        addToCart: List<AddToCart>.from(
            json["addToCart"].map((x) => AddToCart.fromJson(x))),
        deviceHardware: json["deviceHardware"],
        favourite: List<String>.from(json["favourite "].map((x) => x)),
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "mobileName": mobileName,
        "lastSignedIn": lastSignedIn,
        "mobileNumber": mobileNumber,
        "addToCart": List<dynamic>.from(addToCart.map((x) => x.toJson())),
        "deviceHardware": deviceHardware,
        "favourite ": List<dynamic>.from(favourite.map((x) => x)),
        "order": List<dynamic>.from(order.map((x) => x.toJson())),
      };
}

class AddToCart {
  AddToCart({
    required this.productId,
    required this.quantity,
  });

  String productId;
  String quantity;

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}

class Order {
  Order({
    required this.id,
    required this.status,
    required this.date,
    required this.rating,
    required this.trak,
  });

  String id;
  String status;
  String date;
  String rating;
  String trak;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
        date: json["date"],
        rating: json["rating"],
        trak: json["Trak"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "date": date,
        "rating": rating,
        "Trak": trak,
      };
}
