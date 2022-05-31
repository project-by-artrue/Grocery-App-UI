// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery/widget/Phone_TextFilld.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../helper/hellper.dart';

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
                  Helpper().showOtpDilog(
                    size.height,
                    context,
                    otp,
                  );
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

  Future<void> showSnackBar(BuildContext contex, String otp) async {
    // contex = NavigationService.navigatorKey.currentContext!;
    final snackBar = SnackBar(
      content: Text(otp),
      // duration: Duration(seconds: 6),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
