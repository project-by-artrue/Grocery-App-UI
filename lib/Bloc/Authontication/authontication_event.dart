part of 'authontication_bloc.dart';

@immutable
abstract class AuthonticationEvent {}

class GetUser extends AuthonticationEvent {
  String? email;
  String? password;
  String? firstname;
  String? lastname;
  String? mobilno;

  GetUser(
      {this.email,
      this.password,
      this.firstname,
      this.lastname,
      this.mobilno,
     });
}
