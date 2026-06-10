import 'package:flutter/material.dart';

class MainTheme {
  MainTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        primary: Colors.deepPurple.shade500,
        secondary: Colors.deepPurple.shade600,
        surface: Colors.deepPurple.shade800,
      ),
    );
  }
}
