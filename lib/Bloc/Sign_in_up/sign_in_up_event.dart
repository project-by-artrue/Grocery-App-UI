part of 'sign_in_up_bloc.dart';

@immutable
abstract class SignInUpEvent {}

class Get_SignUp extends SignInUpEvent {
  String? pass1;
  String? pass2;
  String? temConditionSignup;
  ButtonState? stateText1;
  ButtonState? stateText2;
  Get_SignUp(
      {this.pass1,
      this.pass2,
      this.temConditionSignup,
      this.stateText2,
      this.stateText1});
}

class Get_SignIn extends SignInUpEvent {
  String? pass;
  String? remember;
  String? temCondition;
  Get_SignIn({this.pass, this.remember, this.temCondition});
}

class PhoneAuth extends SignInUpEvent {
  String? phone;
  String? name;
  String? otp;
  AuthCredential? credential;
  PhoneAuth({this.otp, this.phone, this.name, this.credential});
}

class VerifyOtp extends SignInUpEvent {}

class EmailAuth extends SignInUpEvent {
  String email;
  EmailAuth(this.email);
}

class EmailVerify extends SignInUpEvent {
  bool isVerify;
  EmailVerify(this.isVerify);
}

class Signin extends SignInUpEvent {
  String email;
  String password;
  Signin(this.email, this.password);
}

class ConutryCodes extends SignInUpEvent {
  String countrycode;
  ConutryCodes(this.countrycode);
}

class CreateAccount extends SignInUpEvent {
  String email;
  String password;
  String firstName;
  String lastName;
  String manufacturer;
  String deviceName;
  String hardware;
  String imeiNo;
  String modelName;
  String mobile;

  String confirmPasword;
  String platformVersion;
  CreateAccount(
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.mobile,
    this.confirmPasword,
    this.manufacturer,
    this.deviceName,
    this.hardware,
    this.imeiNo,
    this.modelName,
    this.platformVersion,
  );
}

// class UpdateTextFilld extends SignInUpEvent {
//   String email;
//   String password;
//   String firstname;
//   String lastname;
//   String mobilno;
//   String conformpassword;
//   UpdateTextFilld(this.email, this.password, this.firstname, this.lastname,
//       this.mobilno, this.conformpassword);
// }
