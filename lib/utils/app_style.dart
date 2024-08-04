import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joistic_test/src/gen/colors.gen.dart';

class AppStyles {
  static var themeData = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: 25, fontWeight: FontWeight.w600, color: ColorName.textColor),
      titleSmall: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w400, color: ColorName.textColor),
      titleMedium: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.w500, color: ColorName.textColor),

      displayLarge: GoogleFonts.roboto(
        wordSpacing: 5,
          fontSize: 38, fontWeight: FontWeight.w600, color: ColorName.blackColor),

      displayMedium: GoogleFonts.poppins(
          fontSize: 18, fontWeight: FontWeight.w700, color: ColorName.blackColor),
    ),
  );
}