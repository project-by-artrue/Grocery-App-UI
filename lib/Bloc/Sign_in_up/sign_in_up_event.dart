part of 'sign_in_up_bloc.dart';

@immutable
abstract class SignInUpEvent {}

class Get_SignUp extends SignInUpEvent {
  String? pass1;
  String? pass2;
  String? temConditionSignup;
  Get_SignUp({this.pass1, this.pass2, this.temConditionSignup});
}

class Get_SignIn extends SignInUpEvent {
  String? pass;
  String? remember;
  String? temCondition;
  Get_SignIn({this.pass, this.remember, this.temCondition});
}
