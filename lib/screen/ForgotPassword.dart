// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery/widget/Phone_TextFilld.dart';
import 'package:sms_autofill/sms_autofill.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with TickerProviderStateMixin {
  TextEditingController mobilno = TextEditingController();
  Animation? buttonSqueezeanimation;
  AnimationController? buttonController;
  String otp = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/4498897.jpg"),
                      fit: BoxFit.contain),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                        )
                      ],
                      color: Colors.white),
                  child: Phone_TextFilld(mobilno)),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  showOtpDilog(size.height);
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              )
            ],
          ),
        ),
      )),
    );
  }

  otpLayout() {
    return Padding(
      padding: EdgeInsets.only(
          // left: 50.0,
          // right: 50.0,
          ),
      child: Container(
        height: 30,
        child: PinFieldAutoFill(
          decoration: UnderlineDecoration(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            colorBuilder: FixedColorBuilder(Colors.black),
          ),
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

  Future<void> showOtpDilog(double theight) {
    return showDialog(
      context: context,
      builder: (context) {
        // showSnackBar(context, state.otp);
        return AlertDialog(
          title: Container(
            alignment: Alignment.center,
            child: Text(
              "Verify OTP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.green,
              ),
            ),
          ),
          content: otpLayout(),
          contentPadding: EdgeInsets.only(top: 50, left: 10, right: 10),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 30.0,
                left: 25.0,
                right: 25.0,
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn`t get OTP",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                    onTap: () async {
                      await buttonController!.reverse();
                      // checkNetworkOtp();
                      // a.add(Getlogin(mobile.text, false));
                    },
                    child: Text(
                      "ResendOTP",
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  // if (otp == state.otp) {
                  otp = "";
                  Navigator.pop(context);
                  // } else {
                  //   showSnackBar(context, "Enter Valid OTP");
                  // }
                },
                child: Container(
                  height: 40,
                  width: 120,
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
          ],
        );
      },
    );
  }

  Widget displayProgressDialogue(double theight) {
    return SizedBox(
      height: theight * 0.15,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 200,
            // ),
            Text(
              "Fetching Data....",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SpinKitCubeGrid(
              color: Colors.black,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showSnackBar(BuildContext contex, String otp) async {
    // contex = NavigationService.navigatorKey.currentContext!;
    final snackBar = SnackBar(
      content: Text(otp),
      // duration: Duration(seconds: 6),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
