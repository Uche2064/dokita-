import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:dokitamobile/app/translations/app_text.dart';
import 'package:dokitamobile/app/constants/app_constants.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingMd),
          child: Column(
            children: [
              Gap(150),
              Image.asset(AppConstants.saveMedicalRecord),
              Gap(20),
              Text(
                AppText.stockageSecurise,
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
