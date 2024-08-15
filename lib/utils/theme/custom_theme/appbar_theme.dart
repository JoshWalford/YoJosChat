import 'package:flutter/material.dart';

class YoJoAppbarTheme {
  YoJoAppbarTheme._();

  static AppBarTheme lightAppbarTheme = const AppBarTheme(
    color: Colors.lightBlue,
    elevation: 0.0,
    shadowColor: Colors.transparent,
    centerTitle: true,
    scrolledUnderElevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),
  );
  static AppBarTheme darkAppbarTheme = const AppBarTheme(
    color: Colors.lightBlue,
    elevation: 0.0,
    shadowColor: Colors.transparent,
    centerTitle: true,
    scrolledUnderElevation: 0.0,
    titleTextStyle: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ),
  );
}