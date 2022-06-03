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
  PhoneAuth({
    this.otp,
    this.phone,
    this.name,
  });
}

class EmailAuth extends SignInUpEvent {
  String email;
  EmailAuth(this.email);
}
