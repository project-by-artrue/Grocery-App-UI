// ignore_for_file: prefer_generic_function_type_aliases, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

typedef VoidCallback();

class ListTileCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  final Icon icon;
  VoidCallback ontapfanction;
  ListTileCard(
      this.title, this.subTitle, this.color, this.icon, this.ontapfanction);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontapfanction(),
      child: Container(
        // height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 12,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              )
            ]),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: color),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(color: Colors.black),
          ),
          leading: Container(
              padding: EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: color.withOpacity(0.4)),
              child: icon),
        ),
      ),
    );
  }
}
