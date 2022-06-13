import 'dart:math';

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
  String countryCode = "+91";

  String FirstName = "";
  String LastName = "";
  String MobileNo = "";
  String ModelName = "";
  String DeviceManufacturer = "";
  String DeviceName = "";
  String DeviceImei = "";
  String DeviceHardwere = "";
  String email = "";
  String password = "";
  String confirmpassword = "";

  String l = "";
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
    on<ConutryCodes>((event, emit) {
      countryCode = event.countrycode;
    });
    on<PhoneAuth>((event, emit) async {
      // print(
      //     "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      // if (event.name == "phone") {
      //   await auth.verifyPhoneNumber(
      //       phoneNumber: "+91" + event.phone.toString(),
      //       timeout: const Duration(seconds: 60),
      //       verificationCompleted: (PhoneAuthCredential credential) {
      //         print("complete complete");
      //         SmsOtp = credential.smsCode ?? "";
      //       },
      //       verificationFailed: (FirebaseAuthException e) {
      //         print("mmmmmmmmmmmmmmmmmmmmmmmmmmm${e}");
      //       },
      //       codeSent: (String verificationId, int? resendToken) {
      //         _verificationId = verificationId;
      //         print("ffffffffffffffff${resendToken}");
      //         AuthCredential credential = PhoneAuthProvider.credential(
      //             verificationId: verificationId, smsCode: event.otp ?? "s");
      //       },
      //       codeAutoRetrievalTimeout: (String verificationId) {});
      // }
      // if (event.name == "otp") {
      //   try {
      //     //code is reqvird

      //     phoneCredential = PhoneAuthProvider.credential(
      //         verificationId: _verificationId, smsCode: event.otp ?? "");
      //     print("${phoneCredential.providerId}");
      //     // close

      //     await auth.signInWithCredential(phoneCredential).then((value) {
      //       isMobileVerify = true;
      //       navService.goBack();
      //       stateMobile = ButtonState.success;
      //       navService.pushNamedAndRemoveUntil(
      //         "Dashbord",
      //         predicate: (p0) => false,
      //       );
      //       Map<String, dynamic> map = {
      //         "userId": auth.currentUser!.uid,
      //         "First Name": FirstName,
      //         "Last Name": LastName,
      //         "Email": email,
      //         "Mobile No": MobileNo,
      //         "Model Name": ModelName,
      //         "Device Manufacturer": DeviceManufacturer,
      //         "Device Name": DeviceName,
      //         "Device Imei": DeviceImei,
      //         "Device Hardwere": DeviceHardwere
      //       };
      //       firestore.collection("user").doc(value.user!.uid).set(map);
      //       value.user!.linkWithCredential(event.credential!);
      //       emitSignp();
      //     }).onError((error, stackTrace) {
      //       print("llllllllllllllll${error}");
      //     });
      //   } catch (e) {
      //     // if (e.code == "invalid-verification-code") {
      //     //   showToastMessage(e.code);
      //     // } else {
      //     //   showToastMessage(e.code);
      //     // }
      //     // stateMobile = ButtonState.fail;
      //     emitSignp();
      //     print("sssssssssssssssssssss${e}");
      //   }
      // }
      if (event.name == "phone") {
        stateMobile = ButtonState.loading;
        print("object/////////////////////$countryCode${event.phone}");
        List<String> list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
        list.shuffle();
        list = list.getRange(0, 6).toList();
        l = list.join("");
        try {
          print("<<<<<<<<<<<<<<<<<<<<<<${l}");
          print("<<<<<<<<<<<<<<<<<<<<<<$countryCode${event.phone}");
          HttpsCallable callable =
              FirebaseFunctions.instance.httpsCallable('sendOtp');
          final HttpsCallableResult result = await callable
              .call(<String, dynamic>{
            'mobileNo': "$countryCode${event.phone}",
            'otpText': "your otp is ${l}"
          });
          print(">>>>>>>>>>>>>>>>>>${result.data}");
          isMobileVerify = true;
        } catch (e) {
          stateMobile = ButtonState.fail;
        }

        emitSignp();
      }
      if (event.name == "otp") {
        print("kkkkkkkkkk${event.otp}");
        if (event.otp == l) {
          print("ssssssssssssssssssssssssssssssssssss");
          navService.goBack();
          stateMobile = ButtonState.success;
          isMobileVerify = true;
          emitSignp();
        } else {
          print("aaaaaaaas");
        }
      }
    });

    // create account
    on<CreateAccount>((event, emit) async {
      print("oooooooooooooooo");

      final cridential = EmailAuthProvider.credential(
          email: event.email, password: event.password);
      // await auth.createUserWithEmailAndPassword(
      //     email: event.email, password: event.password);

      // final user = auth.currentUser;
      // await user!.linkWithCredential(phoneCredential).then((value) {
      //   auth.currentUser!.reauthenticateWithCredential(phoneCredential);

      FirstName = event.firstName;
      LastName = event.lastName;
      MobileNo = event.mobile;
      ModelName = event.modelName;
      DeviceManufacturer = event.manufacturer;
      DeviceName = event.deviceName;
      DeviceImei = event.imeiNo;
      DeviceHardwere = event.hardware;
      email = event.email;
      password = event.password;
      print("fffffffffff${password}");
      try {
        // print("<<<<<<<<<<<<<<<<<<<<<<${FirebaseAuth.instance.currentUser!}");
        HttpsCallable callable =
            FirebaseFunctions.instance.httpsCallable('createUser');
        final HttpsCallableResult result =
            await callable.call(<String, dynamic>{
          'email': email,
          'phoneNumber': countryCode + MobileNo,
          'password': password,
          'displayName': FirstName
        });
        print(">??????????????${result.data}");
        if (result.data['statusCode'] == null) {
          showToastMessage("${result.data['message']}");
        } else {
          auth
              .signInWithEmailAndPassword(email: email, password: password)
              .then((value) {
            Map<String, dynamic> map = {
              "userId": auth.currentUser!.uid,
              "First Name": FirstName,
              "Last Name": LastName,
              "Email": email,
              "Mobile No": MobileNo,
              "Model Name": ModelName,
              "Device Manufacturer": DeviceManufacturer,
              "Device Name": DeviceName,
              "Device Imei": DeviceImei,
              "Device Hardwere": DeviceHardwere,
              "Add to cart": [],
              "Favorite product": [],
              "Order": [],
              "Favorite store": []
            };
            firestore.collection("user").doc(value.user!.uid).set(map);
            navService.pushNamed("Dashbord", args: cridential);
          });
        }
      } catch (e) {
        stateMobile = ButtonState.fail;
      }

      // firestore.collection("user").doc(user.uid).set(map);
      // });
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
        stateEmail = ButtonState.loading;
        // print("<<<<<<<<<<<<<<<<<<<<<<${FirebaseAuth.instance.currentUser!}");
        HttpsCallable callable =
            FirebaseFunctions.instance.httpsCallable('sendMail');
        final HttpsCallableResult result = await callable
            .call(<String, dynamic>{
          'email': event.email,
          'otpCode': "https://grocery11.page.link/users/?user=123"
        });
        print("??????????????????????${result.data['statusCode']}");
        if (result.data['statusCode'] == null) {
          showToastMessage("Verification Faild");
          stateEmail = ButtonState.fail;
        } else {
          showToastMessage(
              "Verification Link Sent Successfully Please Check Your Mail Box");

          stateEmail = ButtonState.loading;
        }

        emitSignp();
      } on Exception catch (e) {
        print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu${e.toString()}");
        showToastMessage("Verification Faild");
        stateEmail = ButtonState.fail;
      }
      emitSignp();
    });
    on<Signin>((event, emit) {
      try {
        print("objecxzxdshsdbjbbjt");
        auth
            .signInWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((value) {
          print("ssssssssssssssssssssssssua");
          navService.pushNamedAndRemoveUntil("Dashbord");
        });
      } on Exception catch (e) {
        showToastMessage("Verification Faild");
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        showToastMessage(e.message!);
      }
    });
  }

  emitSignp() {
    emit(ShowSignUp(
        pass1,
        pass2,
        temConditionSignup,
        isVerify,
        stateEmail,
        stateMobile,
        FirstName,
        LastName,
        MobileNo,
        ModelName,
        DeviceManufacturer,
        DeviceName,
        DeviceImei,
        DeviceHardwere,
        email,
        password,
        confirmpassword,isMobileVerify));
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
