import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:grocery/globals.dart' as globals;
part 'authontication_event.dart';
part 'authontication_state.dart';

class AuthonticationBloc
    extends Bloc<AuthonticationEvent, AuthonticationState> {
  AuthonticationBloc() : super(AuthonticationInitial()) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    on<GetUser>((event, emit) async {
      emit(LodingData());
      try {
        final credential = await _auth
            .createUserWithEmailAndPassword(
          email: event.email ?? "",
          password: event.password ?? "",
        )
            .then((value) {
          emit(UpdateUserData());
          value.user!.sendEmailVerification();
          // value.user.ve
          Map<String, dynamic> user = {
            "First Name": event.firstname,
            "Last Name": event.lastname,
            "Mobile No": event.mobilno,
            "Email": event.email,
            "Password": event.password,
            "Model Name": globals.modelName,
            'Device Hardwere': globals.hardware,
            "Device Manufacturer": globals.manufacturer,
            "Device Imei": globals.imeiNo,
            "Device Name": globals.deviceName
          };
          db.collection('user').doc(value.user!.uid).set(user);
          print('pppppppppppppllllllllllllll${value.user!.uid}');
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          emit(SignUpFaill('The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          emit(SignUpFaill('The account already exists for that email.'));
        } else {
          emit(SignUpFaill(e.code));
        }
      } catch (e) {
        print(e);
        emit(SignUpFaill(e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
