import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      fontFamily: 'DIN Next LT Arabic',
      scaffoldBackgroundColor: const Color(0xFF0E151B),
      appBarTheme: const AppBarTheme(

        backgroundColor: Color(0xFF0F1921)
      ),

      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0), // Default border color
        ),
        hintStyle: TextStyle(color: Colors.white54), // Optional: hint text color
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      textTheme: const TextTheme(

        bodyLarge: TextStyle(color: Colors.white)      ),
    );
  }
}
