// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
       leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 40,
          ),
        ),
        title: Text("Change Password"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height * 0.32,
            child: Text("Enter your new password and confirm password"),
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 12,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                )
              ],
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      border: InputBorder.none,
                      hintText: "New Password"),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.4),
                  indent: 20,
                  endIndent: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      hintText: "Confirm Password"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
