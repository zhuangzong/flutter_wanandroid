import 'package:flutter/material.dart';

import 'app_colors.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */



ThemeData get appThemeData => ThemeData(
    primaryColor: mainColor,
    primaryColorBrightness:Brightness.dark,
    primaryColorLight: mainColor,
    scaffoldBackgroundColor: Colors.white,
    primaryIconTheme: const IconThemeData(color: Colors.white),
    primaryTextTheme: const TextTheme(headline6: TextStyle(fontSize: 17,color: Colors.white, fontWeight: FontWeight.bold)),
    accentColor: mainColor,
    appBarTheme: const AppBarTheme(brightness: Brightness.dark),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    canvasColor: Colors.white
);

