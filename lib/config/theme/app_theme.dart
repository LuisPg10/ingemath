import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorSchemeSeed = Colors.green;

class AppTheme {
  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: colorSchemeSeed,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: GoogleFonts.montserrat().copyWith(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      textTheme: TextTheme(
        bodyMedium:
            GoogleFonts.montserrat().copyWith(fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.montserrat()
            .copyWith(fontWeight: FontWeight.w500, fontSize: 14, height: 1.5),
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              textStyle:
                  MaterialStatePropertyAll(GoogleFonts.montserrat().copyWith(
        fontWeight: FontWeight.bold,
      )))));
}
