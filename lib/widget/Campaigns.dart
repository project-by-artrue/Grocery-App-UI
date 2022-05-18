// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Campaigns extends StatelessWidget {
  String compaignsimg;
  Campaigns(this.compaignsimg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.7,
      width: MediaQuery.of(context).size.width / 2.8,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 6.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  compaignsimg,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "offer Campaign",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "Orgenic Shop",
              style: TextStyle(color: Colors.black26, fontSize: 12),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 5),
            // child: Text(
            //   "★★☆☆☆(0)",
            //   style: TextStyle(
            //       color: Colors.black26, fontSize: 12),
            // ),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  "\$560.20",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "★0.0",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ],
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

class Campaigns_Shimmer extends StatelessWidget {
  const Campaigns_Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.7,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3.7,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.7,
                  width: MediaQuery.of(context).size.width / 2.8,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Color.fromARGB(255, 231, 227, 227),
                        direction: ShimmerDirection.ltr,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Color.fromARGB(255, 231, 227, 227),
                        direction: ShimmerDirection.ltr,
                        child: Container(
                          height: 18,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 5, top: 5),
                          color: Colors.white,
                          // child: Text(
                          //   "offer Campaign",
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Color.fromARGB(255, 231, 227, 227),
                        direction: ShimmerDirection.ltr,
                        child: Container(
                          height: 12,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 5, top: 5),
                          color: Colors.white,
                          // child: Text(
                          //   "Orgenic Shop",
                          //   style: TextStyle(color: Colors.black26, fontSize: 12),
                          // ),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Color.fromARGB(255, 231, 227, 227),
                        direction: ShimmerDirection.ltr,
                        child: Container(
                          height: 18,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 5, top: 5, right: 5),
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              // Text(
                              //   "\$560.20",
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              Spacer(),
                              // Text(
                              //   "★0.0",
                              //   style: TextStyle(color: Colors.green),
                              // ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
