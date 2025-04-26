import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dokitamobile/app/routes/app_pages.dart';
import 'package:dokitamobile/app/services/auth_service.dart';
import 'package:dokitamobile/app/constants/app_constants.dart';
import 'package:dokitamobile/app/utils/toast_notification.dart';

class LoginController extends GetxController {
  // Text editing controllers
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  AuthService _authService = AuthService();

  final box = GetStorage();

  // Observable variables
  final RxBool obscurePassword = true.obs;
  final RxBool passwordError = false.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final count = 0.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    // You can perform actions when the controller is ready
    // For example, check if the user is already logged in
    super.onReady();
  }

  @override
  void onClose() {
    // Dispose resources
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  // Login function
  Future<void> login() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final dio = Dio(); // Create Dio instance
      final url = '${AppConstants.baseUrl}/login'; // No need Uri.parse with Dio

      final response = await dio.post(
        url,
        data: {
          'email': emailController.text.trim(),
          'password': passwordController.text,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        final token = data['token'];
        printInfo(info: 'Login successful, token: $token');

        // Save token if needed
        _authService.saveToken(token);
        // Redirection
        Get.offAllNamed(Routes.HOME);
      } else {
        // If not 200 or 201 (created), handle as error
        final errorData = response.data;
        errorMessage.value = errorData['message'] ?? 'Login failed';
        ToastNotification.errorToastBar(content: errorMessage.value);
      }
    } on DioError catch (e) {
      // Specific error handling for Dio
      if (e.response != null) {
        // Server error
        final errorData = e.response?.data;
        errorMessage.value = errorData['message'] ?? 'Erreur de connexion';
        ToastNotification.errorToastBar(content: errorMessage.value);
      } else {
        // Other error (no response, timeout, etc)
        errorMessage.value = 'Erreur réseau : ${e.message}';
        ToastNotification.errorToastBar(content: errorMessage.value);
      }
      printInfo(info: 'Login DioError: $e');
    } catch (e) {
      // Unknown error
      errorMessage.value = 'Erreur inattendue : ${e.toString()}';
      ToastNotification.errorToastBar(content: errorMessage.value);
      printInfo(info: 'Login error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // // Forgot password function
  // void forgotPassword() {
  //   if (emailController.text.isEmpty) {
  //     errorMessage.value = 'Please enter your email first';
  //     return;
  //   }

  //   // Navigate to forgot password screen or show dialog
  //   printInfo(info: 'Forgot password requested for: ${emailController.text}');

  //   // Example: Navigate to forgot password screen
  //   // Get.toNamed('/forgot-password', arguments: {'email': emailController.text});

  //   // Or show a snackbar
  //   Get.snackbar(
  //     'Password Reset',
  //     'Password reset instructions sent to ${emailController.text}',
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Colors.teal,
  //     colorText: Colors.white,
  //   );
  // }

  // Clear form fields
  void clearForm() {
    emailController.clear();
    passwordController.clear();
    passwordError.value = false;
    errorMessage.value = '';
  }

  // // Social login methods (optional)
  // void loginWithGoogle() {
  //   // Implement Google login logic
  //   printInfo(info: 'Login with Google');
  // }

  // void loginWithFacebook() {
  //   // Implement Facebook login logic
  //   printInfo(info: 'Login with Facebook');
  // }

  // void loginWithApple() {
  //   // Implement Apple login logic
  //   printInfo(info: 'Login with Apple');
  // }
}
