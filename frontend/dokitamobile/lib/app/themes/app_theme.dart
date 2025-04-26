import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dokitamobile/app/themes/app_bar_theme/dapp_bar_theme.dart';
import 'package:dokitamobile/app/themes/app_text_theme/app_text_theme.dart';
import 'package:dokitamobile/app/themes/app_color_scheme/app_color_scheme.dart';
import 'package:dokitamobile/app/themes/app_text_button_theme/app_text_button_theme.dart';
import 'package:dokitamobile/app/themes/app_eleveted_button_theme/app_eleveted_button_theme.dart';
import 'package:dokitamobile/app/themes/app_input_decoration_theme/app_input_decoration_theme.dart';

class AppTheme {
  AppTheme._();
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.bgColor,
    appBarTheme: DappBarTheme.lightAppBarTheme,
    colorScheme: AppColorScheme.lightColorScheme,
    textButtonTheme: AppTextButtonTheme.lightTextButtonTheme,
    textTheme: AppTextTheme.lightTextTheme,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: AppElevetedButtonTheme.lightElevetedButtonThemeData,
    
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: DappBarTheme.darkAppBarTheme,
    colorScheme: AppColorScheme.darkColorScheme,
    textButtonTheme: AppTextButtonTheme.darkTextButtonTheme,
    inputDecorationTheme: AppInputDecorationTheme.darkInputDecorationTheme,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevetedButtonTheme.darkElevetedButtonThemeData,
  );
}
