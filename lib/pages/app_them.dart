import 'package:flutter/material.dart';

class AppTheme {
  static const Color maroon = Color(0xFF9F1725);
  static const Color background = Color(0xFFF7F7F7);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: maroon,
    scaffoldBackgroundColor: background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: maroon,
      primary: maroon,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: maroon,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: maroon,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}