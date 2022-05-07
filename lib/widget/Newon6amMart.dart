import 'package:flutter/material.dart';

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
