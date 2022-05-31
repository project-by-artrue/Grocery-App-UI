// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:shimmer/shimmer.dart';

class BestRevieweditem extends StatelessWidget {
  Product? product;
  BestRevieweditem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7.5,
      width: MediaQuery.of(context).size.width / 1.4,
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(product!.displayImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          product!.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.topLeft,
              child: Text(
                product!.storeName,
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 5),
              child: Text(
                "★★☆☆☆(0)",
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            Row(
              children: [
                Text(
                  product!.price,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.add)
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(2.0, 2.0),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
    );
  }
}

class BestRevieweditem_Shimmer extends StatelessWidget {
  const BestRevieweditem_Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 7.5,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 7.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 7.5,
                  width: MediaQuery.of(context).size.width / 1.4,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Color.fromARGB(255, 231, 227, 227),
                      direction: ShimmerDirection.ltr,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    title: Shimmer.fromColors(
                      child: Container(
                        height: 18,
                        color: Colors.white,
                      ),
                      baseColor: Colors.white,
                      highlightColor: Color.fromARGB(255, 231, 227, 227),
                      direction: ShimmerDirection.ltr,
                    ),
                    subtitle: Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Color.fromARGB(255, 231, 227, 227),
                          direction: ShimmerDirection.ltr,
                          child: Container(
                            margin: EdgeInsets.only(left: 5, top: 5),
                            alignment: Alignment.topLeft,
                            height: 12,
                            color: Colors.white,
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Color.fromARGB(255, 231, 227, 227),
                          direction: ShimmerDirection.ltr,
                          child: Container(
                            margin: EdgeInsets.only(left: 5, top: 5),
                            alignment: Alignment.topLeft,
                            height: 12,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor:
                                  Color.fromARGB(255, 231, 227, 227),
                              direction: ShimmerDirection.ltr,
                              child: Container(
                                margin: EdgeInsets.only(left: 5, top: 5),
                                alignment: Alignment.topLeft,
                                height: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
