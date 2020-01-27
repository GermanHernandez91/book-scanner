import 'package:flutter/material.dart';

abstract class Themes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    accentColor: Colors.deepOrangeAccent,
  );

  static ThemeData darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
  );
}
