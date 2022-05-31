// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:grocery/model/product.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  Product p;

  ProductCard(this.p, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        // color: Colors.yellow,
                        ),
                    child: CachedNetworkImage(imageUrl: p.displayImage),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    right: 19,
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(9),
                          bottomRight: Radius.circular(9),
                        ),
                      ),
                      child: Text(
                        "20%OFF",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.title,
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  p.storeName,
                  style: TextStyle(color: Colors.grey[109]),
                ),
                GFRating(
                    allowHalfRating: true,
                    borderColor: Colors.grey,
                    color: Colors.grey,
                    showTextForm: false,
                    size: 19,
                    onChanged: (Raiting) => null,
                    value: 4.5),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "\$${p.price} ",
                    style: TextStyle(color: Color.fromARGB(255, 86, 86, 86)),
                  ),
                  TextSpan(
                      text: "\$${p.marketValue}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color.fromARGB(255, 86, 86, 86)))
                ]))
              ],
            ),
          ),
          Spacer(),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.add), Icon(Icons.favorite_border)],
            ),
          )
        ],
      ),
    );
  }
}

class ProductSimer extends StatelessWidget {
  const ProductSimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(137, 220, 218, 218),
        highlightColor: Colors.white,
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 70,
                      width: 70,
                      color: Colors.white,

                      // child: CachedNetworkImage(imageUrl: p.displayImage),
                    ),
                  ],
                )),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Icon(Icons.add), Icon(Icons.favorite_border)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
