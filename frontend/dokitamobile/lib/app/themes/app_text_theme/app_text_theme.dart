import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();

  static final TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.roboto(
      fontSize: AppSizes.fontSizeLarge,
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: AppSizes.fontSizeMedium,
      color: Colors.black87,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: AppSizes.fontSizeSmall,
      color: Colors.black87,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: AppSizes.fontSizeXLarge,
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
  );

  static final TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.roboto(
      fontSize: AppSizes.fontSizeLarge,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: AppSizes.fontSizeMedium,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: AppSizes.fontSizeSmall,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: AppSizes.fontSizeXLarge,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}
