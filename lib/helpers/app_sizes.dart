import 'package:flutter/material.dart';

class AppSizes {
  static double bottomNavHeight = 70;
  static Map<String, double> appBarsize = {
    'width': appBarHWidth(),
    'height': appBarHeight()
  };

  static Size deviceSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double appBarHeight() {
    return AppBar().preferredSize.height;
  }

  static double appBarHWidth() {
    return AppBar().preferredSize.width;
  }
}
