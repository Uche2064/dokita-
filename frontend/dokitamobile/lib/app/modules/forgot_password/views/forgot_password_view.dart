import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dokitamobile/app/widgets/loader.dart';
import '../controllers/forgot_password_controller.dart';
import 'package:dokitamobile/app/utils/validators.dart';
import 'package:dokitamobile/app/themes/app_colors.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokitamobile/app/constants/app_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dokitamobile/app/widgets/custom_input_text_field.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(AppSizes.paddingLg),
                  child: Column(
                    children: [
                      // Back button and menu
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.ellipsis,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),

                      Gap(50.h),

                      // Logo
                      Image.asset(AppConstants.appLogo, height: 100.h),

                      Gap(40.h),

                      // Title
                      Text(
                        "Mot de passe oublié",
                        style: GoogleFonts.roboto(
                          fontSize: AppSizes.fontSizeLarge,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      Gap(20.h),

                      // Subtitle
                      Text(
                        "Entrez votre adresse e-mail pour recevoir un lien de réinitialisation de mot de passe.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: AppSizes.fontSizeMedium,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),

                      Gap(40.h),

                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            // Email input
                            CustomTextInputField(
                              hintText: "john.doe@gmail.com",
                              prefixIcon: FontAwesomeIcons.solidEnvelope,
                              controller: controller.emailController,
                              validator:
                                  (email) => Validators.validateEmail(email),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Gap(30.h),

                // Bottom container
                Container(
                  width: double.maxFinite,
                  height: Get.height.h / 2.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.h),
                      topRight: Radius.circular(50.h),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.paddingLg),
                    child: Column(
                      children: [
                        Gap(70.h),

                        // Send reset link button
                        SizedBox(
                          width: double.maxFinite,
                          child: Obx(
                            () => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: AppColors.primaryColor,
                              ),
                              onPressed:
                                  controller.isLoading.value
                                      ? null
                                      : () {
                                        if (controller.formKey.currentState!
                                            .validate()) {
                                          controller.sendResetLink();
                                        }
                                      },
                              child:
                                  controller.isLoading.value
                                      ? const Loader()
                                      : Text(
                                        "Envoyer le lien",
                                        style: Get.textTheme.bodyMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                            ),
                          ),
                        ),

                        Gap(20.h),

                        // Back to login button
                        SizedBox(
                          width: double.maxFinite,
                          child: OutlinedButton(
                            onPressed: () => Get.back(),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: AppColors.primaryColor,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Retour à la connexion",
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
