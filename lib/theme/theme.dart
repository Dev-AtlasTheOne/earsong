import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.purple.shade500,
    secondary: Colors.purple.shade600,
    surface: Colors.purple.shade800,
    onSurface: Colors.white,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.deepPurple.shade500,
    secondary: Colors.deepPurple.shade600,
    surface: Colors.deepPurple.shade800,
    onSurface: Colors.white,
  ),
);
