import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dokitamobile/app/widgets/custom_input_text_field.dart';
import 'package:dokitamobile/app/modules/register_step/views/widgets/section_title.dart';
import 'package:dokitamobile/app/modules/register_step/controllers/register_step_controller.dart';

class MedecinInfoStep extends GetView<RegisterStepController> {
  MedecinInfoStep({super.key});
  final color = Get.theme.colorScheme;
  final texttheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(AppSizes.fontMd),
          Text(
            "Informations Professionnelles",
            style: texttheme.titleMedium!.copyWith(color: color.primary),
          ),
          Gap(AppSizes.fontMd),
          Text(
            "Veuillez remplir vos coordonnées professionnelles",
            style: texttheme.titleSmall!.copyWith(color: color.onSecondary),
          ),
          Gap(AppSizes.paddingXl),

          // Professional identifiers section
          SectionTitle(title: "Identifiants Professionnels", icon: Icons.badge),
          Gap(AppSizes.fontSm),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMd),
              child: Column(
                children: [
                  CustomTextInputField(
                    hintText: "Numéro d'ordre",
                    prefixIcon: Icons.numbers,
                    controller: controller.numeroOrdreController,
                    validator:
                        (value) =>
                            value!.isEmpty ? "Numéro d'ordre requis" : null,
                  ),
                  Gap(AppSizes.fontMd),
                  CustomTextInputField(
                    hintText: "Numéro de licence",
                    prefixIcon: Icons.card_membership,
                    controller: controller.numeroLicenceController,
                    validator:
                        (value) =>
                            value!.isEmpty ? "Numéro de licence requis" : null,
                  ),
                  Gap(AppSizes.fontMd),
                  CustomTextInputField(
                    hintText: "Numéro de sécurité sociale",
                    prefixIcon: Icons.security,
                    controller: controller.numeroSecuriteSocialeController,
                    validator:
                        (value) =>
                            value!.isEmpty
                                ? "Numéro de sécurité sociale requis"
                                : null,
                  ),
                ],
              ),
            ),
          ),

          Gap(AppSizes.paddingLg),

          // Professional profile section
          SectionTitle(title: "Profil Professionnel", icon: Icons.person),
          Gap(AppSizes.fontSm),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingMd),
              child: Column(
                children: [
                  CustomTextInputField(
                    hintText: "Spécialité",
                    prefixIcon: Icons.medical_services,
                    controller: controller.specialiteController,
                    validator:
                        (value) => value!.isEmpty ? "Spécialité requise" : null,
                  ),
                  Gap(AppSizes.fontMd),
                  CustomTextInputField(
                    hintText: "Années d'expérience",
                    prefixIcon: Icons.calendar_today,
                    keyboardType: TextInputType.number,
                    controller: controller.anneeExperienceController,
                    validator:
                        (value) =>
                            value!.isEmpty
                                ? "Années d'expérience requises"
                                : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
