import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Helpper {
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
   Future<void> showOtpDilog(double theight, BuildContext context, String otp, AnimationController buttonController) {
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
          content: otpLayout(otp),
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
                      await buttonController.reverse();
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
otpLayout(String otp) {
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

}