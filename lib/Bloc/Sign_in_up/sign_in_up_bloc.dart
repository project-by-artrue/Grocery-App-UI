import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:meta/meta.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'sign_in_up_event.dart';
part 'sign_in_up_state.dart';

class SignInUpBloc extends Bloc<SignInUpEvent, SignInUpState> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String SmsOtp = "";
  String _verificationId = "";
  bool isVerify = false;
  bool isMobileVerify = false;
  bool remember = false;
  bool pass = false;
  bool termCondition = false;
  bool pass1 = false;
  bool pass2 = false;
  bool temConditionSignup = true;
  ButtonState stateMobile = ButtonState.idle;
  ButtonState stateEmail = ButtonState.idle;
  late PhoneAuthCredential phoneCredential;
  SignInUpBloc() : super(SignInUpInitial()) {
    on<Get_SignUp>((event, emit) {
      // TODO: implement event handler
      if (event.pass1 == 'true') {
        pass1 = !pass1;
      }
      if (event.pass2 == 'true') {
        pass2 = !pass2;
      }
      if (event.temConditionSignup == 'true') {
        temConditionSignup = !temConditionSignup;
      }

      emitSignp();
    });
    on<Get_SignIn>((event, emit) {
      // TODO: implement event handler

      if (event.remember == 'true') {
        remember = !remember;
      }
      if (event.pass == 'true') {
        pass = !pass;
      }
      if (event.temCondition == 'true') {
        termCondition = !termCondition;
      }

      emit(ShowSignIn(pass, remember, termCondition));
    });
    on<PhoneAuth>((event, emit) async {
      if (event.name == "phone") {
        await auth.verifyPhoneNumber(
            phoneNumber: "+91" + event.phone.toString(),
            timeout: const Duration(seconds: 60),
            verificationCompleted: (PhoneAuthCredential credential) {
              print("complete complete");
              SmsOtp = credential.smsCode ?? "";
            },
            verificationFailed: (FirebaseAuthException e) {
              print("mmmmmmmmmmmmmmmmmmmmmmmmmmm${e}");
            },
            codeSent: (String verificationId, int? resendToken) {
              _verificationId = verificationId;
              print("ffffffffffffffff${resendToken}");
              AuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: event.otp ?? "s");
            },
            codeAutoRetrievalTimeout: (String verificationId) {});
      }
      if (event.name == "otp") {
        try {
          //code is reqvird

          phoneCredential = PhoneAuthProvider.credential(
              verificationId: _verificationId, smsCode: event.otp ?? "");
          print("${phoneCredential.providerId}");
          // close
          isMobileVerify = true;
          navService.goBack();
          stateMobile = ButtonState.success;
          emitSignp();

          // await auth.signInWithCredential(credential).then((value) {
          //   credential = value.credential ??
          //       AuthCredential(providerId: "", signInMethod: "");

          //   print("<<<<<<<<<<<<<<<<<<<<${credential.providerId}");
          // });
          // //   print("${value.user}[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]");

          //
          // });

        } catch (e) {
          // if (e.code == "invalid-verification-code") {
          //   showToastMessage(e.code);
          // } else {
          //   showToastMessage(e.code);
          // }
          // stateMobile = ButtonState.fail;
          emitSignp();
          print("sssssssssssssssssssss${e.toString()}");
        }
      }
    });

    // create account
    on<CreateAccount>((event, emit) async {
      print("oooooooooooooooo");

      // final cridential = EmailAuthProvider.credential(
      //     email: event.email, password: event.password);
      await auth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      final user = auth.currentUser;
      await user!.linkWithCredential(phoneCredential).then((value) {
        auth.currentUser!.reauthenticateWithCredential(phoneCredential);
        Map<String, dynamic> map = {
          "userId": auth.currentUser!.uid,
          "First Name": event.firstName,
          "Last Name": event.lastName,
          "Mobile No": event.mobile,
          "Model Name": event.modelName,
          "Device Manufacturer": event.manufacturer,
          "Device Name": event.deviceName,
          "Device Imei": event.imeiNo,
          "Device Hardwere": event.hardware
        };
        firestore.collection("user").doc(user.uid).set(map);

        navService.pushReplacementNamed("Dashbord");
      });
    });
    // email verifyed
    on<EmailVerify>((event, emit) {
      isVerify = event.isVerify;
      stateEmail = ButtonState.success;
      print("objectsssssssssssssssssssssss${isVerify}");
      emitSignp();
    });

    // send link in email
    on<EmailAuth>((event, emit) async {
      try {
        // print("<<<<<<<<<<<<<<<<<<<<<<${FirebaseAuth.instance.currentUser!}");
        HttpsCallable callable =
            FirebaseFunctions.instance.httpsCallable('sendMail');
        final HttpsCallableResult result = await callable
            .call(<String, dynamic>{
          'email': event.email,
          'otpCode': "https://grocery11.page.link/users/?user=123"
        });
        print("??????????????????????${result.data['statusCode']}");
        showToastMessage(
            "Verification Link Sent Successfully Please Check Your Mail Box");

        stateEmail = ButtonState.loading;
      } on Exception catch (e) {
        print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu${e.toString()}");
        showToastMessage("Verification Faild");
        stateEmail = ButtonState.fail;
      }
      emitSignp();
    });
  }

  emitSignp() {
    emit(ShowSignUp(pass1, pass2, temConditionSignup, isVerify, isMobileVerify,
        stateMobile, stateEmail));
  }

  showToastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
