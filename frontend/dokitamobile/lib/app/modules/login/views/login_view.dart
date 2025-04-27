import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dokitamobile/app/widgets/loader.dart';
import 'package:dokitamobile/app/routes/app_pages.dart';
import 'package:dokitamobile/app/utils/validators.dart';
import 'package:dokitamobile/app/themes/app_colors.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokitamobile/app/constants/app_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dokitamobile/app/widgets/custom_input_text_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.paddingLg),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: FaIcon(
                          FontAwesomeIcons.ellipsis,
                          color: Colors.white,
                          size: AppSizes.iconLg,
                        ),
                      ),
                      Gap(30.h),
                
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Bon retour 👋",
                          style: Get.textTheme.headlineLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Gap(30.h),
                
                      Image.asset(AppConstants.appLogo, height: 115.h),
                      Gap(30.h),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            // email
                            CustomTextInputField(
                              hintText: "john.doe@gmail.com",
                              prefixIcon: FontAwesomeIcons.solidEnvelope,
                              controller: controller.emailController,
                              validator:
                                  (email) => Validators.validateEmail(email),
                            ),
                            Gap(25.h),
                
                            // mot de passe
                            Obx(
                              () => CustomTextInputField(
                                hintText: 'Mot de passe',
                                prefixIcon: FontAwesomeIcons.lock,
                                obscureText: controller.obscurePassword.value,
                                controller: controller.passwordController,
                                validator:
                                    (password) =>
                                        Validators.validatePassword(password),
                                suffixIcon: GestureDetector(
                                  onTap: controller.togglePasswordVisibility,
                                  child: Icon(
                                    controller.obscurePassword.value
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text(
                              "Mot de passe oublié?",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.roboto(
                                fontSize: AppSizes.fontSizeMedium,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Gap(25.h),
        
              Container(
                width: double.maxFinite.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.h),
                    topRight: Radius.circular(50.h),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.paddingLg),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed:
                              controller.isLoading.value
                                  ? null
                                  : () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.login();
                                    }
                                  },
                          child: Obx(
                            () =>
                                controller.isLoading.value
                                    ? Loader()
                                    : Text("Se connecter"),
                          ),
                        ),
                      ),
                      Gap(15.h),
        
                      Text(
                        "Or",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
        
                      Gap(15.h),
                      SizedBox(
                        width: double.maxFinite,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.toNamed(Routes.CHOOSE_ROLE);
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.h),
                            ),
                          ),
                          child: Text(
                            "Créer un compte",
                            style: Get.textTheme.bodyLarge!.copyWith(
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
    );
  }
}
