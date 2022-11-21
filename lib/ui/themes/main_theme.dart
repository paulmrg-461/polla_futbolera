import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  static const Color backgroundColor = Color(0xffF9FBFD);
  static const Color primaryColor = Color(0xff6CB33F);
  static const Color secondaryColor = Color(0xff0CCA9A);
  static const Color accentColor = Color(0xff0DCA78);
  static final ThemeData mainTheme = ThemeData(
    // UI
    brightness: Brightness.light,
    primaryColor: const Color(0xff6CB33F),
    backgroundColor: const Color(0xffF9FBFD),
    accentColor: const Color(0xff717073),
    //text style
    textTheme: TextTheme(
      titleLarge:
          GoogleFonts.nunito(fontSize: 26, color: const Color(0xff6CB33F)),
    ),
  );
}
