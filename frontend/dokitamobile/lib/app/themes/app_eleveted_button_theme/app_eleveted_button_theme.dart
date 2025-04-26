import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dokitamobile/app/themes/app_colors.dart';

class AppElevetedButtonTheme {
  AppElevetedButtonTheme._();
  static final lightElevetedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      textStyle: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w600
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
  );

  static final darkElevetedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,

      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
