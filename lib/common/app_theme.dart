import 'package:flutter/material.dart';
import 'package:movieapp/common/Appcolors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      textTheme: TextTheme(
          labelSmall: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColor.DateColor),
          titleMedium: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400)));
}
