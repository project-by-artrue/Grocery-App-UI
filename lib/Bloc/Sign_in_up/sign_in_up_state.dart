part of 'sign_in_up_bloc.dart';

@immutable
abstract class SignInUpState {}

class SignInUpInitial extends SignInUpState {}

class ShowSignUp extends SignInUpState {
  bool pass1;
  bool pass2;
  ButtonState stateText;
  ButtonState buttonState2;
  bool temConditionSignup;
  ShowSignUp(
    this.pass1,
    this.pass2,
    this.temConditionSignup,
    this.stateText,
    this.buttonState2,
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
