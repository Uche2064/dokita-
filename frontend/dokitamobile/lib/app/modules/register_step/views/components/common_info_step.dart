import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dokitamobile/app/widgets/custom_input_text_field.dart';
import 'package:dokitamobile/app/modules/register_step/views/widgets/section_title.dart';
import 'package:dokitamobile/app/modules/register_step/controllers/register_step_controller.dart';

class CommonInfoStep extends StatelessWidget {
  const CommonInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterStepController>();
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: "Informations personnelles",
            icon: FontAwesomeIcons.idBadge,
          ),
          Gap(20.h),

          // Name field
          CustomTextInputField(
            hintText: "Entrez votre nom",
            controller: TextEditingController(
              text:
                  controller.isMedecin
                      ? controller.medecin.nom
                      : controller.patient.nom,
            ),
            prefixIcon: Icons.person_outline,
          ),
          Gap(16.h),

          // First name field
          CustomTextInputField(
            hintText: "Entrez votre prénom",
            controller: TextEditingController(
              text:
                  controller.isMedecin
                      ? controller.medecin.prenom
                      : controller.patient.prenom,
            ),
            prefixIcon: Icons.person,
          ),
          Gap(16.h),

          // Email field
          CustomTextInputField(
            hintText: "Entrez votre email",
            controller: TextEditingController(
              text:
                  controller.isMedecin
                      ? controller.medecin.email
                      : controller.patient.email,
            ),
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          Gap(24.h),

          // Gender selector
          _buildEnhancedSexeSelector(controller, theme),
          Gap(24.h),

          // Address
          CustomTextInputField(
            hintText: "Adresse",
            prefixIcon: Icons.location_on,
            controller: controller.adresseController,
            validator: (value) => value!.isEmpty ? "Adresse requise" : null,
          ),
          Gap(24.h),

          // Phone field
          CustomTextInputField(
            hintText: "Entrez votre numéro de téléphone",
            controller: TextEditingController(
              text:
                  controller.isMedecin
                      ? controller.medecin.telephone
                      : controller.patient.telephone,
            ),
            prefixIcon: Icons.phone_android,
            keyboardType: TextInputType.phone,
          ),
          Gap(24.h),
        ],
      ),
    );
  }

  Widget _buildEnhancedSexeSelector(
    RegisterStepController controller,
    ThemeData theme,
  ) {
    return GetBuilder<RegisterStepController>(
      builder: (ctrl) {
        final currentSexe =
            controller.isMedecin
                ? controller.medecin.sexe
                : controller.patient.sexe;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sexe",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(12.h),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.isMedecin
                          ? controller.medecin.sexe = "M"
                          : controller.patient.sexe = "M";
                      controller.update();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color:
                            currentSexe == "M"
                                ? theme.primaryColor.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.h),
                        border: Border.all(
                          color:
                              currentSexe == "M"
                                  ? theme.primaryColor
                                  : Colors.grey.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.male,
                            size: 36,
                            color:
                                currentSexe == "M"
                                    ? theme.primaryColor
                                    : Colors.grey,
                          ),
                          Gap(8.h),
                          Text(
                            "Masculin",
                            style: TextStyle(
                              color:
                                  currentSexe == "M"
                                      ? theme.primaryColor
                                      : Colors.grey,
                              fontWeight:
                                  currentSexe == "M"
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.isMedecin
                          ? controller.medecin.sexe = "F"
                          : controller.patient.sexe = "F";
                      controller.update();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color:
                            currentSexe == "F"
                                ? theme.primaryColor.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              currentSexe == "F"
                                  ? theme.primaryColor
                                  : Colors.grey.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.female,
                            size: 36.h,
                            color:
                                currentSexe == "F"
                                    ? theme.primaryColor
                                    : Colors.grey,
                          ),
                          Gap(8.h),
                          Text(
                            "Féminin",
                            style: TextStyle(
                              color:
                                  currentSexe == "F"
                                      ? theme.primaryColor
                                      : Colors.grey,
                              fontWeight:
                                  currentSexe == "F"
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
