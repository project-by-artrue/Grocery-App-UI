// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Phone_TextFilld extends StatelessWidget {
  TextEditingController mobilno;
  Widget? suflix;
  Phone_TextFilld( this.mobilno,{this.suflix});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      // height: 20,
      // color: Colors.blue,
      child: IntlPhoneField(
        disableLengthCheck: true,
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
            // isDense: true,
            enabled: true,
            // isCollapsed: true,
            //decoration for Input Field
            hintText: "Phone",
            suffixIcon: suflix,
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
    );
  }
}
