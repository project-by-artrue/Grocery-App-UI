import 'package:flutter/material.dart';

class TextFildCard extends StatelessWidget {
  TextEditingController controll;
  String hint;
  Icon icons;
  bool? isPassword;
  Widget? sufix;

  TextFildCard(this.icons, this.hint, this.controll,
      {this.isPassword, this.sufix});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.green,
      obscureText: isPassword!,
      cursorHeight: 22,
      controller: controll,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        suffixIcon: sufix,
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
