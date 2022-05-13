// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';

class ProfileScreen extends StatefulWidget {
  String isedit;
  ProfileScreen(this.isedit, {Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name = TextEditingController(text: "xyz");
  TextEditingController lastName = TextEditingController(text: "abc");
  TextEditingController email = TextEditingController(text: "abc@gmail.com");
  TextEditingController phone = TextEditingController(text: "+9188779955");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("asset/pexels-matheus-cenali-2733918.jpg"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.26,
            left: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.only(top: size.height * 0.15),
                height: size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: widget.isedit != "edit"
                    ? ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 12,
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                      )
                                    ]),
                                height: size.height * 0.16,
                                width: size.width * 0.4,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0 Days",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(
                                      "Since Joining",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 12,
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                      )
                                    ]),
                                height: size.height * 0.16,
                                width: size.width * 0.4,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(
                                      "Total Order",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.dark_mode,
                                color: Colors.black,
                              ),
                              title: Text("Dark Mode"),
                              trailing: Switch(
                                  value: true,
                                  onChanged: (value) {
                                    value = !value;
                                  }),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.notifications,
                                color: Colors.black,
                              ),
                              title: Text("NotiFication"),
                              trailing: Switch(
                                  value: true,
                                  onChanged: (value) {
                                    value = !value;
                                  }),
                            ),
                          ),
                          Card(
                            shadowColor: Colors.black,
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'Change Password');
                              },
                              leading: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              title: Text("Change Password"),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ProfileScreen("edit");
                                    },
                                  ),
                                );
                              },
                              leading: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              title: Text("Edit Profile"),
                            ),
                          )
                        ],
                      )
                    : ListView(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "First name",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller: name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Last name",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller: lastName,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "E mail",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Phone",
                                    style: TextStyle(color: Colors.grey[600])),
                                TextSpan(
                                    text: "(Non changeable)",
                                    style: TextStyle(color: Colors.red))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller: phone,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              color: Colors.green,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              child: Text(
                                "Update Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
          ),
          Positioned(
            top: size.height * 0.16,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("asset/defaultimage.png"),
                    fit: BoxFit.contain),
                border: Border.all(color: Colors.white, width: 3),
              ),
            ),
          ),
          Positioned(
              top: size.height * 0.37,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Guest",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      )),
    );
  }
}
