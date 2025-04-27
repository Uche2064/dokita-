import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dokitamobile/app/themes/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokitamobile/app/services/auth_service.dart';
import 'package:dokitamobile/app/services/storage_service.dart';
import 'package:dokitamobile/app/translations/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthService());

  final isFirstLaunch = StorageService.isFirstLaunch();
  final userRole = GetStorage().read('userRole');
  final token = AuthService.to.token;

  String initialRoute;

  if (isFirstLaunch) {
    initialRoute = Routes.ONBOARDING;
  } else if (token == null) {
    initialRoute = Routes.LOGIN;
  } else if (userRole == null) {
    initialRoute = Routes.CHOOSE_ROLE;
  } else {
    initialRoute = Routes.HOME;
  }

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: "Dokita+",
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(),
        locale: Get.deviceLocale,
        theme: AppTheme.light,
        fallbackLocale: const Locale('fr', 'FR'),
        initialRoute: initialRoute,
        getPages: AppPages.routes,
      ),
    ),
  );
}
