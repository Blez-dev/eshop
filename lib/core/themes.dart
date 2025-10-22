import 'package:eshop/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BAppThemeData {
  BAppThemeData._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,
    scaffoldBackgroundColor:  Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Color.fromRGBO(0, 150, 136, 1),
      surface: Color(0xFF1C1C1C),
    ),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      titleLarge: BTextTheme.lightTextTheme.titleLarge,
      titleMedium: BTextTheme.lightTextTheme.titleMedium,
      titleSmall: BTextTheme.lightTextTheme.titleSmall,
      bodyLarge: BTextTheme.lightTextTheme.bodyLarge,
      bodyMedium: BTextTheme.lightTextTheme.bodyMedium,
      bodySmall: BTextTheme.lightTextTheme.bodySmall,
      labelLarge: BTextTheme.lightTextTheme.labelLarge,
      labelMedium: BTextTheme.lightTextTheme.labelMedium,
    ),
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
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: BTextTheme.darkTextTheme.titleLarge,
      titleMedium: BTextTheme.darkTextTheme.titleMedium,
      titleSmall: BTextTheme.darkTextTheme.titleSmall,
      bodyLarge: BTextTheme.darkTextTheme.bodyLarge,
      bodyMedium: BTextTheme.darkTextTheme.bodyMedium,
      bodySmall: BTextTheme.darkTextTheme.bodySmall,
      labelLarge: BTextTheme.darkTextTheme.labelLarge,
      labelMedium: BTextTheme.darkTextTheme.labelMedium,
    ),
  );
}
