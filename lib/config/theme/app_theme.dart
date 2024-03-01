import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(

    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: GoogleFonts.montserrat()
        .copyWith( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black ),
    ),

    textTheme: TextTheme(
      bodyMedium: GoogleFonts.montserrat()
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