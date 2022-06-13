import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/model/User.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, UserDetails> user = {};

  List favProduct = [];
  List favStore = [];
  UserBloc() : super(UserInitial()) {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? "";
    on<GetUserDetails>((event, emit) {
      // TODO: implement event handler
      if (uid != "") {
        final userDetails = firestore.collection('user').doc(uid).snapshots();
        userDetails.forEach((element) {
          print("objectsssssssssssssssssssss${element.data()}");
          UserDetails users = UserDetails.fromJson(element.data() ?? {});
          user[users.userId] = users;
          favProduct = users.favoriteProduct;
          favStore = users.favoriteStore;
          favProduct.forEach((element) async {});
          print("${favProduct}...................");
          print(
              "sssssssssssssssssssssssssssaaaaaaaaaaaa${element.data()!['Favorite product']}");
          print("sssssssssssssssssssssssssssaaaaaaaaaaaa${users.email}");
        });
      }
    });
  }
  List getfav() {
    return favProduct;
  }

  bool isfav(String id) {
    return favProduct.contains(id);
  }
}
