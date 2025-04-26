import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokitamobile/app/widgets/custom_input_text_field.dart';
import 'package:dokitamobile/app/modules/register_step/views/widgets/section_title.dart';
import 'package:dokitamobile/app/modules/register_step/controllers/register_step_controller.dart';

class PatientAdresseStep extends GetView<RegisterStepController> {
  const PatientAdresseStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionTitle(title: "Sécurité", icon: Icons.security),
          Gap(16.h),
          // Password field
          CustomTextInputField(
            hintText: "Créez un mot de passe",
            controller: TextEditingController(
              text:
                  controller.isMedecin
                      ? controller.medecin.password
                      : controller.patient.password,
            ),
            prefixIcon: Icons.lock_outline,
            obscureText: true,
          ),
          Gap(16.h),

          // Confirm password field
          CustomTextInputField(
            hintText: "Confirmez votre mot de passe",
            controller: TextEditingController(
              text:
                  controller.isMedecin
                      ? controller.medecin.passwordConfirmation
                      : controller.patient.passwordConfirmation,
            ),
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
