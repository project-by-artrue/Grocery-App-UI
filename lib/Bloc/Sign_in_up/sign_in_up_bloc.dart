import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_up_event.dart';
part 'sign_in_up_state.dart';

class SignInUpBloc extends Bloc<SignInUpEvent, SignInUpState> {
  bool remember = false;
  bool pass = false;
  bool termCondition = false;
  bool pass1 = false;
  bool pass2 = false;
  bool temConditionSignup = false;
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
      print("llllllllllllllllllllll${remember}");

      emit(ShowSignUp(pass1, pass2, temConditionSignup));
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
      print("llllllllllllllllllllll${remember}");

      emit(ShowSignIn(pass, remember, termCondition));
    });
  }
}
