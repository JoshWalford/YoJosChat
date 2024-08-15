import 'package:flutter/material.dart';

class YoJoOutlineButtonTheme {
  YoJoOutlineButtonTheme._();

  static final lightOutlineButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.cyan,
      backgroundColor: Colors.black,
      disabledForegroundColor: Colors.grey[400],
      disabledBackgroundColor: Colors.grey[400],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
  static final darkOutlineButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.cyan,
      backgroundColor: Colors.white,
      disabledForegroundColor: Colors.grey[400],
      disabledBackgroundColor: Colors.grey[400],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}