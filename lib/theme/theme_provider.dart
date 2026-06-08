import 'package:earsong/theme/dark_theme.dart';
import 'package:earsong/theme/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData _themeData = LightTheme;


  ThemeData get themeData => _themeData;

  bool get isDarkTheme => _themeData == DarkTheme;



  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();


  }

  void toggleTheme(){
    if(_themeData == DarkTheme){
      themeData = LightTheme;


    }else{
      themeData = DarkTheme;


    }



  }



}