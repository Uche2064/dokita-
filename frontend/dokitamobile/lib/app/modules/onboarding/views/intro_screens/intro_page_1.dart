import 'package:dokitamobile/app/constants/app_constants.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:dokitamobile/app/translations/app_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingMd),
          child: Column(
            children: [
              Gap(150),
              Image.asset(AppConstants.onlineDoctorBro),
              Gap(20),
              Text(
                AppText.reserveConsultation,
                style: Get.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
