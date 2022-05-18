import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Newon6amMart extends StatelessWidget {
  String newon6amMartImg;
  Newon6amMart(this.newon6amMartImg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 5.5,
          width: MediaQuery.of(context).size.width / 1.8,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 9.9,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        newon6amMartImg,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Country Fire",
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
                  "House:00,Road:00,city:00,Country",
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
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
        Positioned(
          top: 0,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                // margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 9.9,
                width: MediaQuery.of(context).size.width / 1.8,
                alignment: Alignment.center,
                child: Text(
                  "Closed Now",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black45,
                ),
              )),
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                child: Icon(Icons.favorite_border),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
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
              )),
        ),
      ],
    );
  }
}

class Newon6amMart_Shimmer extends StatelessWidget {
  const Newon6amMart_Shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: tWidth * .6,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Color.fromARGB(255, 231, 227, 227),
                            direction: ShimmerDirection.ltr,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Color.fromARGB(255, 231, 227, 227),
                            child: Container(
                              margin: EdgeInsets.only(top: 5, left: 5),
                              color: Colors.white,
                              height: 12,
                              width: tWidth * .6 - 50,
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Color.fromARGB(255, 231, 227, 227),
                            child: Container(
                              margin: EdgeInsets.only(top: 5, left: 5),
                              color: Colors.white,
                              height: 12,
                              width: tWidth * .6 - 50,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            // child: Icon(Icons.favorite_border),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
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
                          )),
                    )
                  ],
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
