import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/register_step_controller.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokitamobile/app/modules/register_step/views/components/common_info_step.dart';
import 'package:dokitamobile/app/modules/register_step/views/components/medecin_info_step.dart';
import 'package:dokitamobile/app/modules/register_step/views/components/patient_security_step.dart';
import 'package:dokitamobile/app/modules/register_step/views/components/medecin_biographie_step.dart';

class RegisterStepView extends GetView<RegisterStepController> {
  RegisterStepView({super.key});
  final color = Get.theme.colorScheme;
  final textTheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingMd,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment:
                controller.currentStep.value > 0
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
            children: [
              if (controller.currentStep.value > 0)
                ElevatedButton.icon(
                  onPressed: controller.previousStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.onSecondary.withValues(alpha: 0.2),
                    foregroundColor: color.onSurface,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                  ),
                  icon: Icon(Icons.arrow_back, size: 18.sp),
                  label: Text(
                    'Précédent',
                    style: GoogleFonts.roboto(fontSize: 16.sp),
                  ),
                ),
              ElevatedButton.icon(
                onPressed: controller.nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color.primary,
                  foregroundColor: color.onPrimary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
                icon: Icon(
                  controller.currentStep.value == controller.totalSteps - 1
                      ? Icons.check
                      : Icons.arrow_forward,
                  size: 18.sp,
                ),
                label: Text(
                  controller.currentStep.value == controller.totalSteps - 1
                      ? 'Valider'
                      : 'Suivant',
                  style: GoogleFonts.roboto(fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: color.onPrimary,
        foregroundColor: color.primary,
        elevation: 0,
        title: Text(
          'Créer votre compte',
          style: textTheme.headlineSmall!.copyWith(color: color.primary),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.paddingMd,
            vertical: AppSizes.paddingLg,
          ),
          decoration: BoxDecoration(color: color.onPrimary),
          child: Column(
            children: [
              // Step indicator and title section
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Étape ${controller.currentStep.value + 1}/${controller.totalSteps}',
                        style: textTheme.titleSmall!.copyWith(
                          color: color.primary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _getStepTitle(controller.currentStep.value),
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Gap(10.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.h),
                    child: LinearProgressIndicator(
                      value:
                          (controller.currentStep.value + 1) /
                          controller.totalSteps,
                      minHeight: 6.h,
                      color: color.primary,
                      backgroundColor: color.onSecondary,
                    ),
                  ),
                ],
              ),

              Gap(30.h),

              // Step indicators
              SizedBox(
                height: 65.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.totalSteps,
                    (index) => _buildStepIndicator(index),
                  ),
                ),
              ),

              Gap(20.h),

              // Content area with animated transitions
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                      ) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.1, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: _buildStepContent(controller.currentStep.value),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStepIndicator(int index) {
    final isActive = controller.currentStep.value == index;
    final isCompleted = controller.currentStep.value > index;

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 35.w,
            height: 35.w,
            decoration: BoxDecoration(
              color:
                  isActive
                      ? color.primary
                      : isCompleted
                      ? color.primary.withOpacity(0.7)
                      : Colors.grey.shade200,
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    isActive || isCompleted
                        ? color.primary
                        : Colors.grey.shade300,
                width: 2,
              ),
              boxShadow:
                  isActive
                      ? [
                        BoxShadow(
                          color: color.primary.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ]
                      : null,
            ),
            child: Center(
              child:
                  isCompleted
                      ? Icon(Icons.check, color: Colors.white, size: 20.sp)
                      : Text(
                        '${index + 1}',
                        style: textTheme.titleMedium!.copyWith(
                          color: isActive ? color.onPrimary : color.onSecondary,
                        ),
                      ),
            ),
          ),
          Gap(8.h),
          Text(
            _getStepShortName(index),
            textAlign: TextAlign.center,
            style: textTheme.titleSmall!.copyWith(
              color: isActive ? color.primary : color.onSecondary,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return CommonInfoStep();
      case 1:
        return controller.isMedecin ? MedecinInfoStep() : PatientAdresseStep();
      case 2:
        return MedecinBiographieStep();
      default:
        return SizedBox();
    }
  }

  String _getStepTitle(int step) {
    switch (step) {
      case 0:
        return 'Informations Générales';
      case 1:
        return controller.isMedecin
            ? 'Informations Professionnelles'
            : 'Sécurité';
      case 2:
        return 'Biographie';
      default:
        return '';
    }
  }

  String _getStepShortName(int step) {
    switch (step) {
      case 0:
        return 'Info';
      case 1:
        return controller.isMedecin ? 'Pro' : 'Securité';
      case 2:
        return 'Bio';
      default:
        return '';
    }
  }
}
