// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Sign_in_up/sign_in_up_bloc.dart';
import 'package:grocery/Bloc/Store/store_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerification extends StatefulWidget {
  AuthCredential credentianal;
  OtpVerification(this.credentianal, {Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String otp = '';
  @override
  Widget build(BuildContext context) {
    SignInUpBloc s = BlocProvider.of<SignInUpBloc>(context);
    double thight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            ),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: thight,
          child: Column(
            children: [
              SizedBox(
                height: thight * 0.1,
              ),
              Container(
                height: thight * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/bwink_bld_03_single_03.png"),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: thight * 0.08,
              ),
              Container(
                height: thight * 0.1,
                child: otpLayout(),
              ),
              SizedBox(
                height: thight * 0.01,
              ),
              Container(
                height: thight * 0.1,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    s.add(PhoneAuth(
                        otp: otp,
                        name: "otp",
                        credential: widget.credentianal));
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "Verify OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resend Otp",
                  style: TextStyle(color: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  otpLayout() {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.0,
        right: 25.0,
      ),
      child: Container(
        height: 20,
        child: PinFieldAutoFill(
          decoration: UnderlineDecoration(
              gapSpace: 6,
              textStyle: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
              // strokeWidth: 2,
              // lineHeight: 3,
              colorBuilder: FixedColorBuilder(Colors.green),
              bgColorBuilder: FixedColorBuilder(
                  Color.fromARGB(255, 208, 208, 208).withOpacity(0.5))),
          currentCode: otp,
          codeLength: 6,
          onCodeChanged: (String? code) {
            otp = code!;
          },
          onCodeSubmitted: (String code) {
            otp = code;
          },
        ),
      ),
    );
  }
}
