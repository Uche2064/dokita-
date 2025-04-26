import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:dokitamobile/app/themes/app_colors.dart'; // si tu veux utiliser tes propres couleurs

class ToastNotification {
  static successToastBar({String title = "Succès", required String content}) {
    ElegantNotification.success(
      width: Get.width.h / 1.2,
      background: AppColors.successColor, // Ou Colors.green si tu veux
      displayCloseButton: false,
      animationCurve: Curves.easeIn,
      title: Text(
        title,
        style: Get.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        content,
        style: Get.textTheme.bodySmall!.copyWith(color: Colors.white),
      ),
      onDismiss: () {},
    ).show(Get.context!);
  }

  static warningToastBar({
    String title = "Attention",
    required String content,
  }) {
    ElegantNotification.info(
      width: Get.width.h / 1.2,
      background: Colors.blue,
      displayCloseButton: false,
      animationCurve: Curves.easeIn,
      title: Text(
        title,
        style: Get.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        content,
        style: Get.textTheme.bodySmall!.copyWith(color: Colors.white),
      ),
      onDismiss: () {},
    ).show(Get.context!);
  }

  static errorToastBar({String title = "Erreur", required String content}) {
    ElegantNotification.error(
      width: Get.width.h / 1.2,
      background: const Color(0xFFFF2929),
      displayCloseButton: false,
      animationCurve: Curves.easeIn,
      title: Text(
        title,
        style: Get.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        content,
        style: Get.textTheme.bodySmall!.copyWith(color: Colors.white),
      ),
      onDismiss: () {},
    ).show(Get.context!);
  }
}
