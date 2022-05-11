import 'package:flutter/material.dart';
import 'package:grocery/screen/ViewAllCategories_Screen.dart';

class CategoriesName extends StatelessWidget {
  String categoriesname;
  String buttonname;
  String routes;
  CategoriesName(this.categoriesname, this.buttonname, this.routes, {Key? key})
      : super(key: key);

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
            Navigator.pushNamed(context, routes);
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
