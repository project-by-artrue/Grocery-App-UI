// ignore_for_file: void_checks, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:grocery/widget/ListTileCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HelpSupport extends StatefulWidget {
  HelpSupport({Key? key}) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
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
          title: Text(
            "Help & Support",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Image.asset(
              "asset/nip_mart.png",
              height: size.height * 0.4,
              width: size.width,
            ),
            SizedBox(
              height: 20,
            ),
            ListTileCard(
                "Address",
                "House 00,Road:00City-0000, Country",
                Colors.blueAccent,
                Icon(
                  Icons.location_on,
                  color: Colors.blueAccent,
                ),
                () {}),
            SizedBox(
              height: 15,
            ),
            ListTileCard(
                "Call",
                "9574019029",
                Colors.red,
                Icon(
                  Icons.call,
                  color: Colors.red,
                ),
                getCall),
            SizedBox(
              height: 15,
            ),
            ListTileCard(
                "Email Us",
                "Support@6amtech.com",
                Colors.green,
                Icon(
                  Icons.email_outlined,
                  color: Colors.green,
                ), () {
              final Uri params = Uri(
                scheme: 'mailto',
                path: 'Support@6amtech.com',
                query: 'subject=&body=',
              );
              final url = params.toString();
              launch(url);
            })
          ],
        ));
  }

  void getCall() async {
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    String number = '9574019029'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    print("lllfff");
  }
}
