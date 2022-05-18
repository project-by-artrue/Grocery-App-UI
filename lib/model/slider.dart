// To parse this JSON data, do
//
//     final slider = sliderFromJson(jsonString);

import 'dart:convert';

import 'package:grocery/widget/Carousel.dart';

CarouselSlider sliderFromJson(String str) =>
    CarouselSlider.fromJson(json.decode(str));

String sliderToJson(CarouselSlider data) => json.encode(data.toJson());

class CarouselSlider {
  CarouselSlider({
    required this.index,
    required this.image,
  });

  String index;
  String image;

  factory CarouselSlider.fromJson(Map<String, dynamic> json) => CarouselSlider(
        index: json["index"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "image": image,
      };
}
