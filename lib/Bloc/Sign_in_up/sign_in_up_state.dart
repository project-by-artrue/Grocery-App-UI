part of 'sign_in_up_bloc.dart';

@immutable
abstract class SignInUpState {}

class SignInUpInitial extends SignInUpState {}

class ShowSignUp extends SignInUpState {
  bool pass1;
  bool pass2;

  bool temConditionSignup;
  bool isVerify;
  String firstName;
  String lastName;
  String mobileNo;
  String modelName;
  String deviceManufacturer;
  String deviceName;
  String deviceImei;
  String deviceHardwere;
  String email;
  ButtonState stateEmail;
  ButtonState statePhone;
  String password;
  String confirmpassword;
  bool isMobileVerify;
  ShowSignUp(
    this.pass1,
    this.pass2,
    this.temConditionSignup,
    this.isVerify,
    this.stateEmail,
    this.statePhone,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.modelName,
    this.deviceManufacturer,
    this.deviceName,
    this.deviceImei,
    this.deviceHardwere,
    this.email,
    this.password,
    this.confirmpassword,
    this.isMobileVerify,
  );
}

class ShowSignIn extends SignInUpState {
  bool pass;
  bool remember;

  bool tarnCondition;
  ShowSignIn(
    this.pass,
    this.remember,
    this.tarnCondition,
  );
}
