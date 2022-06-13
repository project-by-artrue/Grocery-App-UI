// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    required this.order,
    required this.email,
    required this.modelName,
    required this.favoriteProduct,
    required this.favoriteStore,
    required this.deviceHardwere,
    required this.firstName,
    required this.userId,
    required this.deviceManufacturer,
    required this.deviceImei,
    required this.addToCart,
    required this.mobileNo,
    required this.lastName,
    required this.deviceName,
  });

  List<dynamic> order;
  String email;
  String modelName;
  List<dynamic> favoriteProduct;
  List<dynamic> favoriteStore;
  String deviceHardwere;
  String firstName;
  String userId;
  String deviceManufacturer;
  String deviceImei;
  List<String> addToCart;
  String mobileNo;
  String lastName;
  String deviceName;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        order: List<dynamic>.from(json["Order"].map((x) => x)),
        email: json["Email"],
        modelName: json["Model Name"],
        favoriteProduct:
            List<dynamic>.from(json["Favorite product"].map((x) => x)),
        favoriteStore: List<dynamic>.from(json["Favorite store"].map((x) => x)),
        deviceHardwere: json["Device Hardwere"],
        firstName: json["First Name"],
        userId: json["userId"],
        deviceManufacturer: json["Device Manufacturer"],
        deviceImei: json["Device Imei"],
        addToCart: List<String>.from(json["Add to cart"].map((x) => x)),
        mobileNo: json["Mobile No"],
        lastName: json["Last Name"],
        deviceName: json["Device Name"],
      );

  Map<String, dynamic> toJson() => {
        "Order": List<dynamic>.from(order.map((x) => x)),
        "Email": email,
        "Model Name": modelName,
        "Favorite product": List<dynamic>.from(favoriteProduct.map((x) => x)),
        "Favorite store": List<dynamic>.from(favoriteStore.map((x) => x)),
        "Device Hardwere": deviceHardwere,
        "First Name": firstName,
        "userId": userId,
        "Device Manufacturer": deviceManufacturer,
        "Device Imei": deviceImei,
        "Add to cart": List<dynamic>.from(addToCart.map((x) => x)),
        "Mobile No": mobileNo,
        "Last Name": lastName,
        "Device Name": deviceName,
      };
}
