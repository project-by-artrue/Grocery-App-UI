import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:meta/meta.dart';
import 'package:progress_state_button/progress_button.dart';

part 'sign_in_up_event.dart';
part 'sign_in_up_state.dart';

class SignInUpBloc extends Bloc<SignInUpEvent, SignInUpState> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String _verificationId = "";
  bool remember = false;
  bool pass = false;
  bool termCondition = false;
  bool pass1 = false;
  bool pass2 = false;
  bool temConditionSignup = true;
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

      emit(ShowSignUp(pass1, pass2, temConditionSignup,
          stateText: ButtonState.idle, buttonState2: ButtonState.idle));
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
      print("wwwwwwwwwwwwwwwwwwwww${event.phone}");
      if (event.name == "phone") {
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        await auth.verifyPhoneNumber(
            phoneNumber: "+91" + event.phone.toString(),
            timeout: const Duration(seconds: 60),
            verificationCompleted: (PhoneAuthCredential credential) {
              print("complete complete");
            },
            verificationFailed: (FirebaseAuthException e) {
              print("mmmmmmmmmmmmmmmmmmmmmmmmmmm${e}");
            },
            codeSent: (String verificationId, int? resendToken) {
              _verificationId = verificationId;
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId, smsCode: event.otp ?? "s");
              print(
                  "//////////////////////////////////////////${_verificationId}");
            },
            codeAutoRetrievalTimeout: (String verificationId) {});
      }
      if (event.name == "otp") {
        try {
          //code is reqvird
          AuthCredential credential = PhoneAuthProvider.credential(
              verificationId: _verificationId, smsCode: event.otp ?? "");
          print("5555555555555555${_verificationId.toString()}");
          print("```````````````````````````${event.otp.toString()}");
          // ignore: unnecessary_null_comparison
          if (credential == null) {
            print("nulllllllllllllllllllllllllllll");
          } else {
            print("qwqwqwqwqwwqqwwq${credential}");
            final emailcreditional = auth
                .createUserWithEmailAndPassword(
                    email: "adf@gmail.com", password: "123456789",)
                .then((value) async {
              value.user;
              await value.user!.linkWithCredential(credential);
              print("!****************${value.user}");
            });
          
            final existingUser = await auth.currentUser!;
            UserCredential linkauthresult =
                await existingUser.linkWithCredential(credential);
            print("#####################${linkauthresult.additionalUserInfo}");
            //close

          }
        } catch (e) {
          print("sssssssssssssssssssss${e.toString()}");
        }
      }
    });
    on<EmailAuth>((event, emit) async {
      try {
        // print("<<<<<<<<<<<<<<<<<<<<<<${FirebaseAuth.instance.currentUser!}");
        HttpsCallable callable =
            FirebaseFunctions.instance.httpsCallable('sendMail');
        final HttpsCallableResult result =
            await callable.call(<String, dynamic>{
          'email': "kevinshingala73462@gmail.com",
          'otpCode': "https://grocery11.page.link/users/?user=123"
        });
        print("?????????????????????????${result.data}");
      } catch (e) {
        print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu${e.toString()}");
      }
    });
  }
}
