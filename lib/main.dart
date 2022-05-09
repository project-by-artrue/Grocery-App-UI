import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screen/Home_Screen.dart';
import 'package:grocery/screen/ShowCategoriesItem.dart';
import 'package:grocery/screen/ViewAllCategories.dart';
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
      },
      home: Home(),
    ),
  );
}
