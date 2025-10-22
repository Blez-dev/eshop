import 'package:flutter/material.dart';

class BTextTheme {
  BTextTheme._();

  // Light Theme Text Styles
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 30,

      fontWeight: FontWeight.w900,
      color: const Color(0xff1E232C),
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: const Color.fromRGBO(125, 125, 125, 1),
    ),
    titleSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color(0xFF60655C),
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black.withValues(alpha: 0.5),
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black.withValues(alpha: 0.5),
    ),
  );

  // Dark Theme Text Styles
  static TextTheme darkTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(244, 244, 244, 1),
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: const Color.fromRGBO(139, 139, 139, 1),
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white.withValues(alpha: 0.5),
    ),
    labelLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white.withValues(alpha: 0.5),
    ),
  );
}
