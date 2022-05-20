import 'package:flutter/material.dart';
import 'package:grocery/screen/ShowCategoriesItem.dart';

class routHellper {
  static MaterialPageRoute? hellper(RouteSettings settings) {
    if (settings.name == "ShowCategoriesItem") {
      final id = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => ShowCategoriesItem(id),
      );
    }
    return null;
  }
}
