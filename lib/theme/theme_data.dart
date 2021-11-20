import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData appLightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      // textTheme: GoogleFonts.(Theme.of(context).textTheme)
    );
  }

  static ThemeData appDarkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      // textTheme: GoogleFonts.latoTextTheme(),
    );
  }
}
