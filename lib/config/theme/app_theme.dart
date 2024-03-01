import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorSchemeSeed = Colors.green;

class AppTheme {
  ThemeData getTheme() => ThemeData(

    colorSchemeSeed: colorSchemeSeed,

    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: GoogleFonts.montserrat()
        .copyWith( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black ),
    ),

    textTheme: TextTheme(
      bodyMedium: GoogleFonts.montserrat().copyWith(
        fontWeight: FontWeight.bold,
      )
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          GoogleFonts.montserrat().copyWith(
            fontWeight: FontWeight.bold,
          )
        )
      )
    )
  );
}