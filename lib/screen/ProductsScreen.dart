import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:grocery/model/model.dart';
import 'package:grocery/widget/ProductCard.dart';
import 'package:grocery/widget/Store.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Badge(
              alignment: Alignment.center,
              padding: EdgeInsets.all(2),
              badgeContent: Text("12"),
              position: BadgePosition.topEnd(top: 3),
              badgeColor: Colors.green,
              child: Icon(
                Icons.shopping_cart_sharp,
                color: Colors.black,
              ),
            ),
          )
        ],
        leading: Icon(
          Icons.navigate_before_outlined,
          color: Colors.black,
          size: 35,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Popular Store",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: model().store.length,
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }
}
