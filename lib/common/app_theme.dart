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
  static ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        color: Color(0xFFB5B4B4),
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFF121312),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1D1E1D),
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
    ),
  );
}
