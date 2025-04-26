import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;
  RxBool onLastPage = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();

    // Start automatic sliding
    _timer = Timer.periodic(const Duration(milliseconds: 3000), (Timer timer) {
      if (currentPage.value < 2) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        // If on the last page, stop sliding
        _timer?.cancel();
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
