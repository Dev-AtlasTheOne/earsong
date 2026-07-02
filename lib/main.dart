import 'package:earsong/paginas/home_screen.dart';
import 'package:earsong/theme/main_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), theme: MainTheme.darkTheme);
  }
}
