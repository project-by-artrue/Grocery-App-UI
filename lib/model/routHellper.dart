import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screen/OtpVerification.dart';
import 'package:grocery/screen/ProductsScreen.dart';
import 'package:grocery/screen/ShowCategoriesItem.dart';
import 'package:grocery/screen/StoreDetailScreen.dart';

class routHellper {
  static MaterialPageRoute? hellper(RouteSettings settings) {
    if (settings.name == "OtpVerification") {
      final credentianal = settings.arguments as AuthCredential;
      return MaterialPageRoute(
        builder: (context) => OtpVerification(credentianal),
      );
    } else if (settings.name == "ShwoStoreDetails") {
      final storeName = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => StoreDetailsScreen(storeName),
      );
    } else if (settings.name == "ShowCategoriesItem") {
      final id = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => ShowCategoriesItem(id),
      );
    } else if (settings.name == "Product") {
      final appbarname = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => ProductScreen(appbarname),
      );
    }

    return null;
  }
}
