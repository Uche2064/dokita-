import 'package:flutter/material.dart';
import 'package:dokitamobile/app/themes/app_colors.dart';

class AppColorScheme {
  AppColorScheme._();

  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.primaryColor,
    onPrimary: AppColors.bgColor,
    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.grayColor,
    error: AppColors.errorColor,
  );

  static const darkColorScheme = ColorScheme.dark(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    error: AppColors.errorColor,
  );
}
