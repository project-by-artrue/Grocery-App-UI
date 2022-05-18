// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grocery/model/slider.dart';
import 'package:shimmer/shimmer.dart';

class Carousel extends StatelessWidget {
  List<CarouselSlider> list;
  Carousel(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tWidth = MediaQuery.of(context).size.width;
    return GFCarousel(
      height: 150,
      autoPlay: true,
      autoPlayCurve: Curves.linearToEaseOut,
      autoPlayAnimationDuration: Duration(seconds: 1),
      autoPlayInterval: Duration(seconds: 4),
      hasPagination: true,
      items: List.generate(list.length, (index) {
        print(list[index]);
        return Container(
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: CachedNetworkImage(
              imageUrl: list[index].image,
              width: tWidth * .8,
              fit: BoxFit.fill,
              placeholder: (context, url) => placeHolder(tWidth),
            ),
          ),
        );
      }),
      onPageChanged: (index) {},
    );
  }

  Widget placeHolder(double tWidth) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Color.fromARGB(137, 220, 218, 218),
      child: Container(
        height: 150,
        width: tWidth * .8,
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}

class Crousel_Shimmer extends StatelessWidget {
  const Crousel_Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tWidth = MediaQuery.of(context).size.width;
    return GFCarousel(
      height: 150,
      autoPlay: true,
      autoPlayCurve: Curves.linearToEaseOut,
      autoPlayAnimationDuration: Duration(seconds: 1),
      autoPlayInterval: Duration(seconds: 4),
      hasPagination: true,
      items: List.generate(4, (index) {
        return Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Color.fromARGB(137, 220, 218, 218),
          child: Container(
            margin: EdgeInsets.all(8.0),
            height: 150,
            width: tWidth * .8,
            color: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        );
      }),
    );
  }
}
