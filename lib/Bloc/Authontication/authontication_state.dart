part of 'authontication_bloc.dart';

@immutable
abstract class AuthonticationState {}

class AuthonticationInitial extends AuthonticationState {}

class UpdateUserData extends AuthonticationState {}

class LodingData extends AuthonticationState {}

class SignUpFaill extends AuthonticationState {
  String error;
  SignUpFaill(this.error);
}
