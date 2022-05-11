import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screen/Home_Screen.dart';
import 'package:grocery/screen/SetLocation_Screen.dart';
import 'package:grocery/screen/ShowCategoriesItem.dart';
import 'package:grocery/screen/SignUp_Screen.dart';
import 'package:grocery/screen/ViewAllCategories_Screen.dart';
import 'package:grocery/screen/StoreDetailScreen.dart';
import 'package:grocery/screen/StoreScreen.dart';
import 'package:grocery/screen/BottomBar.dart';
import 'package:grocery/screen/demo.dart';

Future<void> main() async {
  // await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'Home': (context) => Home(),
        'ViewAllCategories': (context) => ViewAllCategories(),
        'SetLocation': (context) => SetLocation(),
      },
      home: SignUP(),
    ),
  );
}
