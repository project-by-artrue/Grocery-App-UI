import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  String image;
  String tital;
  CategoryCard(this.image,this.tital);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            child: Image.network(image),
          ),
          SizedBox(
            height: 10,
          ),
          Text(tital)
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
    );
  }
}
