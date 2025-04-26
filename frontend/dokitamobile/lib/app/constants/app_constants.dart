import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._(); // private constructor

  // App Info
  static const String appName = 'My Awesome App';
  static const String appVersion = '1.0.0';

  // API
  static const String baseUrl = 'https://127.0.0.1/api';

  // Storage Keys
  static const String accessTokenKey = 'ACCESS_TOKEN';
  static const String refreshTokenKey = 'REFRESH_TOKEN';
  static const String languageCodeKey = 'LANGUAGE_CODE';

  // Defaults
  static Locale? defaultLanguage = Get.deviceLocale; // or 'en'
  static const int requestTimeout = 30000; // in milliseconds

  // Regex Patterns
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  // Animation durations
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Illustrations

  static const String appLogo = 'assets/logos/logo_light.png';

  static const String _basePath = 'assets/illustrations';

  static const String forgotPassword = '$_basePath/Forgot-Password.png';
  static const String mailSent = '$_basePath/Mail-Sent.png';
  static const String onlineDoctorBro = '$_basePath/Online-Doctor-bro.png';
  static const String otpVerification = '$_basePath/OTP-Verification.png';
  static const String pushNotificationsRafiki =
      '$_basePath/Push-notifications-rafiki.png';
  static const String resetPassword = '$_basePath/Reset-Password.png';
  static const String saveMedicalRecord = '$_basePath/Save-Medical-Record.png';
  static const String updatePassword = '$_basePath/Update-Password.png';
}
