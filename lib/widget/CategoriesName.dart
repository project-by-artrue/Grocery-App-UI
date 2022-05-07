import 'package:flutter/material.dart';

class CategoriesName extends StatelessWidget {
  String categoriesname;
  String buttonname;

  CategoriesName(this.categoriesname, this.buttonname, {Key? key})
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
          onPressed: () {},
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
