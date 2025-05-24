import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  primaryColor: const Color(0xFFA90140),
  scaffoldBackgroundColor: const Color(0xFF121212),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFFA90140),
    foregroundColor: Colors.white,
    titleTextStyle: GoogleFonts.lobster(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.lobster(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.syne(
      fontSize: 18,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.syne(
      fontSize: 16,
      color: Colors.white,
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: const Color(0xFF1A1A1A),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFFA90140),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      textStyle: GoogleFonts.syne(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1A1A1A),
    hintStyle: GoogleFonts.syne(
      color: Colors.white54,
      fontSize: 16,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
);