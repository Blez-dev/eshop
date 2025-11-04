import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BTextTheme {
  BTextTheme._();

  // Light Theme Text Styles
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: GoogleFonts.lato(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: const Color(0xff1E232C),
    ),
    titleMedium: GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: const Color.fromRGBO(125, 125, 125, 1),
    ),
    titleSmall: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF60655C),
    ),
    bodyLarge: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black.withValues(alpha: 0.5),
    ),
    labelLarge: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black.withValues(alpha: 0.5),
    ),
  );

  // Dark Theme Text Styles
  static TextTheme darkTextTheme = TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(244, 244, 244, 1),
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: const Color.fromRGBO(139, 139, 139, 1),
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white.withValues(alpha: 0.5),
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white.withValues(alpha: 0.5),
    ),
  );
}
