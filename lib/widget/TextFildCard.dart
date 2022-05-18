import 'package:flutter/material.dart';

typedef String? CallbackValidator(String? a);

class TextFildCard extends StatelessWidget {
  TextEditingController controll;
  String hint;
  Icon icons;
  bool? isPassword;
  CallbackValidator? callback;
  Widget? sufix;

  TextFildCard(this.icons, this.hint, this.controll,
      {this.isPassword, this.sufix, this.callback});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.green,
      obscureText: isPassword ?? false,
      cursorHeight: 22,
      controller: controll,
      validator: (value) {
        if (isPassword ?? false) {
          return null;
        }
        if (callback != null) {
          return callback!(value);
        } else {
          return null;
        }
        // return null;
      },
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
