import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/onboarding_controller.dart';
import 'package:dokitamobile/app/routes/app_pages.dart';
import 'package:dokitamobile/app/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokitamobile/app/translations/app_text.dart';
import 'package:dokitamobile/app/services/storage_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dokitamobile/app/modules/onboarding/views/components/app_icon.dart';
import 'package:dokitamobile/app/modules/onboarding/views/intro_screens/intro_page_1.dart';
import 'package:dokitamobile/app/modules/onboarding/views/intro_screens/intro_page_2.dart';
import 'package:dokitamobile/app/modules/onboarding/views/intro_screens/intro_page_3.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.currentPage.value = index;
                controller.onLastPage.value = (index == 2);
              },
              children: [IntroPage1(), IntroPage2(), IntroPage3()],
            ),

            // skip, suivant
            Align(
              alignment: Alignment(0.85.h, 0.55.h),
              child: TextButton(
                onPressed: () {
                  controller.pageController.jumpToPage(2);
                },
                child: Text(AppText.sauter.tr),
              ),
            ),

            Obx(() {
              if (controller.currentPage.value == 2) {
                Future.delayed(Duration(seconds: 2), () {
                  // Naviguer vers Home automatiquement après 2 secondes
                  Get.offAllNamed(Routes.CHOOSE_ROLE);
                  // Et mettre à jour que l'utilisateur a vu l'onboarding
                  StorageService.setFirstLaunchDone();
                });
              }

              return controller.currentPage.value > 0
                  ? Align(
                    alignment: Alignment(-0.8.h, 0.89.h),
                    child: GestureDetector(
                      onTap: () {
                        controller.pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                        );
                      },
                      child: Text(
                        AppText.retour,
                        style: Get.textTheme.bodyLarge,
                      ),
                    ),
                  )
                  : SizedBox.shrink();
            }),

            Align(
              alignment: Alignment(5.h, 2.1.h),
              child: Container(
                height: 430.h,
                width: 395.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    // Le texte + l'icône ensemble
                    Positioned(
                      top: 75.h,
                      left: 125.h,
                      child: Obx(
                        () =>
                            controller.onLastPage.value
                                // start
                                ? GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.HOME);
                                  },
                                  child: Text(
                                    AppText.commencer.tr,
                                    style: Get.textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                                : GestureDetector(
                                  onTap: () {
                                    controller.pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: NextIcon(),
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // indicateur de page
            Container(
              alignment: Alignment(-0.90.h, -0.85.h),
              child: SmoothPageIndicator(
                controller: controller.pageController,
                effect: SlideEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotColor: AppColors.grayColor,
                ),
                count: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
