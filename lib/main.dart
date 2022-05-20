import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/Bloc/Authontication/authontication_bloc.dart';
import 'package:grocery/Bloc/Category/category_bloc.dart';
import 'package:grocery/Bloc/Product/products_bloc.dart';
import 'package:grocery/Bloc/Sign_in_up/sign_in_up_bloc.dart';
import 'package:grocery/Bloc/location/location_bloc.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/routHellper.dart';

import 'package:grocery/screen/AboutUs_Screen.dart';
import 'package:grocery/screen/Address.dart';
import 'package:grocery/screen/ChangePasword.dart';
import 'package:grocery/screen/ConfirmOrder.dart';
import 'package:grocery/screen/Coupon.dart';
import 'package:grocery/screen/Favourite_Screen.dart';
import 'package:grocery/screen/ForgotPassword.dart';
import 'package:grocery/screen/Help&Support.dart';
import 'package:grocery/screen/Home_Screen.dart';
import 'package:grocery/screen/Intro_Screen.dart';
import 'package:grocery/screen/Language.dart';
import 'package:grocery/screen/MyCart_Screen.dart';
import 'package:grocery/screen/MyOrder_Screen.dart';
import 'package:grocery/screen/ProductsScreen.dart';
import 'package:grocery/screen/Profile.dart';
import 'package:grocery/screen/SetLocation_Screen.dart';
import 'package:grocery/screen/ShowBottomSheetBar.dart';
import 'package:grocery/screen/ShowCategoriesItem.dart';
import 'package:grocery/screen/SignUp_Screen.dart';
import 'package:grocery/screen/Sign_In.dart';
import 'package:grocery/screen/ViewAllCategories_Screen.dart';
import 'package:grocery/screen/StoreDetailScreen.dart';
import 'package:grocery/screen/StoreScreen.dart';
import 'package:grocery/screen/BottomBar.dart';
import 'package:grocery/screen/demo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/widget/BestReviewedItem.dart';
import 'package:grocery/widget/Campaigns.dart';
import 'package:grocery/widget/PopularStores.dart';
import 'package:grocery/widget/Store.dart';
import 'package:provider/provider.dart';
import 'package:grocery/globals.dart' as globals;

import 'Bloc/Slider/slider_bloc.dart';
import 'helper/deviceHelpper.dart';

Future<void> main() async {
  // await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DeviceHellper().initPlatformState();

  // String productdata = await rootBundle.loadString("asset/slider.json");
  // final data = await json.decode(productdata);
  // print(data["slider"].length.toString());

  // final collection = FirebaseFirestore.instance.collection("slider");

  // for (int i = 0; i < data['slider'].length; i++) {
  //   collection.add(data['slider'][i]).then((value) {
  //     // collection.doc(value.id).update({'productId': value.id});
  //   });
  // }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => SignInUpBloc(),
        ),
        BlocProvider(
          create: (context) => AuthonticationBloc(),
        ),
        BlocProvider(
          create: (context) => SliderBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryBloc(BlocProvider.of<ProductsBloc>(context)),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'Home': (context) => Home(),
          'ViewAllCategories': (context) => ViewAllCategories(),
          'SetLocation': (context) => SetLocation(),
          'ShwoStoreDetails': (context) => StoreDetailsScreen(),
          'Store': (context) => StoreScreen(),
          'Product': (context) => ProductScreen(),
          'documentation': (context) => AboutUs(),
          'Profile': (context) => ProfileScreen(""),
          'Confirm Order': (context) => ChackOut(),
          'Dashbord': (context) => BottomBar(),
          'Change Password': (context) => ChangePassword(),
          'Offer Coupan': (context) => Coupon(),
          'Help&support': (context) => HelpSupport(),
          'Favourite': (context) => Favourite(),
          'MyCart': (context) => MyCart(),
          'MyOrder': (context) => MyOrder(),
          'ProductScreen': (context) => ProductScreen(),
          'Sign_In': (context) => Sign_In(),
          'SignUP': (context) => SignUP(),
          'IntroScreen': (context) => IntroScreen(),
          'Address': (context) => Address(),
          'Language': (context) => Language(),
          'ForgotPassword': (context) => ForgotPassword(),
        },
        onGenerateRoute: (settings) => routHellper.hellper(
          settings,
        ),
        home: BottomBar(),
      ),
    ),
  );
}
