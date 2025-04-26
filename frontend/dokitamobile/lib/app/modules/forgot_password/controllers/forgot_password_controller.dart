import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dokitamobile/app/utils/toast_notification.dart';

class ForgotPasswordController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text editing controller
  late TextEditingController emailController;

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool resetSent = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  // Send password reset link
  void sendResetLink() async {
    try {
      // Show loading indicator
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Handle successful reset request
      // Replace with your actual API call
      printInfo(info: 'Password reset link sent to: ${emailController.text}');

      // Update UI state
      resetSent.value = true;
      isLoading.value = false;

      // Show success message
      ToastNotification.successToastBar(
        content:
            'Un lien de réinitialisation a été envoyé à ${emailController.text}',
      );

      // Optionally navigate back to login after a delay
      Future.delayed(const Duration(seconds: 2), () {
        Get.back();
      });
    } catch (e) {
      // Handle error
      isLoading.value = false;
      errorMessage.value = 'Erreur: ${e.toString()}';

      ToastNotification.errorToastBar(
        content:
            'Impossible d\'envoyer le lien de réinitialisation. Veuillez réessayer.',
      );

      printError(info: 'Reset password error: $e');
    }
  }

  // Clear form
  void clearForm() {
    emailController.clear();
    errorMessage.value = '';
  }
}
