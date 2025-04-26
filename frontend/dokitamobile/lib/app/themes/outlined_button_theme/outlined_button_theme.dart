import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dokitamobile/app/themes/app_colors.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._();

  static final lightOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.primaryColor, width: 5),
      foregroundColor: AppColors.primaryColor,
      elevation: 0,
      textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
  );

  static final darkOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.white, width: 5),
      foregroundColor: Colors.white,
      elevation: 0,

      textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
