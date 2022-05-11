// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery/widget/TextFildCard.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conformpassword = TextEditingController();

  bool chack = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/logo.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // height:,
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFildCard(
                      Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black26,
                      ),
                      "First Name",
                      firstname,
                    ),
                    Divider(),
                    TextFildCard(
                      Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black26,
                      ),
                      "Last Name",
                      lastname,
                    ),
                    Divider(),
                    TextFildCard(
                      Icon(
                        Icons.email_outlined,
                        color: Colors.black26,
                      ),
                      "E-mail",
                      email,
                    ),
                    Divider(),
                    // TextFildCard(
                    //   Icon(
                    //     Icons.phone,
                    //     color: Colors.black26,
                    //   ),
                    //   "Phon",
                    //   mobilno,
                    // ),
                    IntlPhoneField(
                      dropdownIconPosition: IconPosition.trailing,
                      // dropdownTextStyle: TextStyle(color: Colors.green),
                      dropdownIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.green,
                      ),
                      showCountryFlag: true,
                      cursorColor: Colors.green,
                      cursorHeight: 22,
                      controller: mobilno,
                      decoration: InputDecoration(
                          //decoration for Input Field
                          hintText: "Phon",
                          border: InputBorder.none),
                      initialCountryCode: 'India',
                      //default contry code, NP for Nepal
                      onChanged: (phone) {
                        //when phone number country code is changed
                        print(phone.completeNumber); //get complete number
                        print(phone.countryCode); // get country code only
                        print(phone.number); // only phone number
                      },
                    ),
                    Divider(),
                    TextFildCard(
                      Icon(
                        Icons.lock_outlined,
                        color: Colors.black26,
                      ),
                      "Password",
                      password,
                    ),
                    Divider(),
                    TextFildCard(
                      Icon(
                        Icons.lock_outline,
                        color: Colors.black26,
                      ),
                      "Conform Password",
                      conformpassword,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        chack = value!;
                      });
                    },
                    value: chack,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'I agree with '),
                        TextSpan(
                          text: 'Trems & Conditions',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 8),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Continue as ',
                      style: TextStyle(color: Colors.black26),
                    ),
                    TextSpan(
                      text: 'Guest',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
