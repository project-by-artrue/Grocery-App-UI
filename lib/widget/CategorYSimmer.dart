// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery/widget/ProductCard.dart';

class CategoruSimmer extends StatelessWidget {
  const CategoruSimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            // c.add(GetCategory());
            // Navigator.pushReplacementNamed(context, "Dashbord");
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 40,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ProductSimer();
        },
      ),
    );
  }
}