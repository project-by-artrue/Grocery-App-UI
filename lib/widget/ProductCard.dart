// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

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
                      color: Colors.yellow,
                      image: DecorationImage(
                        image: AssetImage(
                          "asset/Lemon.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
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
                  "avocado",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Shop Name ",
                  style: TextStyle(color: Colors.grey[109]),
                ),
                GFRating(
                    allowHalfRating: true,
                    borderColor: Colors.grey,
                    color: Colors.grey,
                    showTextForm: false,
                    size: 19,
                    onChanged: (rating) {},
                    value: 4.5),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "\$200 ",
                    style: TextStyle(color: Color.fromARGB(255, 86, 86, 86)),
                  ),
                  TextSpan(
                      text: "\$300",
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
