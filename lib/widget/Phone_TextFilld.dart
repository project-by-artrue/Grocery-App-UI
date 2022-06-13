// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Sign_in_up/sign_in_up_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

typedef void OnchangeUpdater(BuildContext context);

class Phone_TextFilld extends StatelessWidget {
  TextEditingController mobilno;
  Widget? suflix;

  bool? isRead;
  OnchangeUpdater? onchange;
  Phone_TextFilld(this.mobilno, {this.suflix, this.isRead, this.onchange});

  @override
  Widget build(BuildContext context) {
    SignInUpBloc p = BlocProvider.of<SignInUpBloc>(context);
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      // height: 20,
      // color: Colors.blue,
      child: IntlPhoneField(
        validator: (p0) {
          print("llllllllllllll");
          if (p0!.completeNumber.isEmpty) {
            return "Enter Vailid Mobil Number";
          }
          if (p0.number.isEmpty) {
            return "This Field is reqvired";
          }
          return null;
        },
        readOnly: isRead ?? false,
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
        initialCountryCode: 'IN',
        //default contry code, NP for Nepal
        onChanged: (phone) {
          //when phone number country code is changed
          p.add(ConutryCodes(phone.countryCode));
          print(phone.completeNumber); //get complete number
          print(phone.countryCode); // get country code only
          print(phone.number); // only phone number
          if (onchange != null) {
            onchange!(context);
          }
        },
      ),
    );
  }
}
