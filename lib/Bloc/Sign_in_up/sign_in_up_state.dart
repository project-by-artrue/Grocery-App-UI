part of 'sign_in_up_bloc.dart';

@immutable
abstract class SignInUpState {}

class SignInUpInitial extends SignInUpState {}

class ShowSignUp extends SignInUpState {}

class ShowSignIn extends SignInUpState {
  bool pass;
  bool remember;

  bool tarnCondition;
  ShowSignIn(this.pass, this.remember, this.tarnCondition);
}
