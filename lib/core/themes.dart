import 'package:eshop/core/text_styles.dart';
import 'package:flutter/material.dart';

class BAppThemeData {
  BAppThemeData._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Color.fromRGBO(0, 150, 136, 1),
      surface: Color(0xFF1C1C1C),
    ),
    textTheme: BTextTheme.lightTextTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: Color.fromRGBO(219, 48, 34, 1),
      secondary: Color.fromRGBO(0, 150, 136, 1),
      surface: Color(0xFF1C1C1C),
    ),
    textTheme: BTextTheme.darkTextTheme,
  );
}
