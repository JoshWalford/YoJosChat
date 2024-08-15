import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outline_button_theme.dart';
import 'custom_theme/text_theme.dart';

class YoJoAppTheme {
  YoJoAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
    scaffoldBackgroundColor: Colors.white,
    textTheme: YoJoTextTheme.lightTheme,
    elevatedButtonTheme: YoJoElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: YoJoAppbarTheme.lightAppbarTheme,
    outlinedButtonTheme: YoJoOutlineButtonTheme.lightOutlineButton
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.cyan,
    scaffoldBackgroundColor: Colors.black,
    textTheme: YoJoTextTheme.darkTheme,
    elevatedButtonTheme: YoJoElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: YoJoAppbarTheme.darkAppbarTheme,
    outlinedButtonTheme: YoJoOutlineButtonTheme.darkOutlineButton
  );
}