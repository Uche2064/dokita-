import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dokitamobile/app/routes/app_pages.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokitamobile/app/translations/app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dokitamobile/app/modules/choose_role/controllers/choose_role_controller.dart';

class ChooseRoleView extends GetView<ChooseRoleController> {
  ChooseRoleView({Key? key}) : super(key: key);


  final color = Get.theme.colorScheme;
  final String patient = "patient";
  final String medecin = "medecin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.onPrimary,
        foregroundColor: color.primary,
      ),
      body: Padding(
        padding:  EdgeInsets.all(AppSizes.paddingMd),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sélectionnez votre rôle',
              style: Get.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color.primary,
                fontSize: AppSizes.fontSizeXLarge,
              ),
            ),
            Gap(40.h),

            // Patient Card with Animation
            Obx(
              () => AnimatedSlide(
                offset:
                    controller.isPatientVisible.value
                        ? Offset.zero
                        : Offset(-1.5, 0),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuart,
                child: AnimatedOpacity(
                  opacity: controller.isPatientVisible.value ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 400),
                  child: _buildRoleCard(
                    title: 'Je suis un Patient',
                    icon: Icons.person,
                    color: Colors.blue,
                    onTap: () => controller.chooseRole(patient),
                    description: 'Accédez à vos rendez-vous et dossier médical',
                  ),
                ),
              ),
            ),

            Gap(20.h),

            // Médecin Card with Animation
            Obx(
              () => AnimatedSlide(
                offset:
                    controller.isMedecinVisible.value
                        ? Offset.zero
                        : Offset(1.5, 0),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                child: AnimatedOpacity(
                  opacity: controller.isMedecinVisible.value ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 400),
                  child: _buildRoleCard(
                    title: 'Je suis un Médecin',
                    icon: FontAwesomeIcons.kitMedical,
                    color: Colors.green,
                    onTap: () => controller.chooseRole(medecin),
                    description: 'Gérez vos patients et votre agenda',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required String description,
  }) {
    return Card(
      elevation: 4.h,
      shadowColor: color.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.h),
        splashColor: color.withOpacity(0.2),
        highlightColor: color.withOpacity(0.1),
        child: Container(
          padding: EdgeInsets.all(AppSizes.paddingMd),
          height: 140.h,
          child: Row(
            children: [
              Container(
                width: 80.h,
                height: 80.h,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: Icon(icon, color: color, size: 42.h),
              ),
              Gap(20.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800)
                    ),
                    Gap(8.h),
                    Text(
                      description,
                      style: Get.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Icon(FontAwesomeIcons.chevronRight, color: color, size: 18.h),
            ],
          ),
        ),
      ),
    );
  }
}
