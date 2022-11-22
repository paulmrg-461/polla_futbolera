import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  static const Color backgroundColor = Color(0xffF9FBFD);
  static const Color primaryColor = Color(0xff8b1539);
  static const Color secondaryColor = Color(0xff8a1538);
  static const Color accentColor = Color(0xfffb134d);
  static final ThemeData mainTheme = ThemeData(
    // UI
    brightness: Brightness.light,
    primaryColor: primaryColor,
    backgroundColor: backgroundColor,
    accentColor: accentColor,
    //text style
    textTheme: TextTheme(
      titleLarge: GoogleFonts.nunito(fontSize: 26, color: primaryColor),
    ),
  );
}
