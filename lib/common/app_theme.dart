import 'package:flutter/material.dart';

class AppTheme {
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
