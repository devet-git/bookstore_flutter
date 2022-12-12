import 'package:flutter/material.dart';
import 'dart:math';

class AppColors {
  static Color? primary = Colors.green[100];
  static Color random() =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
