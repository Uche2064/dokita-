import 'package:dokitamobile/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DappBarTheme {
  DappBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
  );

  static final darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
  );
}
