import 'package:flutter/material.dart';

import 'package:grocery/screen/ViewAllCategories_Screen.dart';

class CategoriesName extends StatelessWidget {
  String categoriesname;
  String buttonname;
  String routes;
  String?argumen;
  CategoriesName(this.categoriesname, this.buttonname, this.routes, {this.argumen});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          categoriesname,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            String a="";
            Navigator.pushNamed(context, routes,arguments: argumen!=null ? argumen:null);
          },
          child: Text(
            buttonname,
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
