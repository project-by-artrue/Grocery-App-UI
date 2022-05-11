import 'package:flutter/material.dart';

class TextFildCard extends StatelessWidget {
  TextEditingController controll;
  String hint;
  Icon icons;
  TextFildCard(this.icons, this.hint, this.controll, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.green,
      cursorHeight: 22,
      controller: controll,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        prefixIcon: icons,
        // prefixIconColor: Colors.black26,

        // prefixIcon: Icon(
        //   // Icons.account_circle_outlined,
        //   icons,
        //   color: Colors.black26,
        // ),
      ),
    );
  }
}
