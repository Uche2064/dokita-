import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dokitamobile/app/utils/validators.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokitamobile/app/widgets/custom_input_text_field.dart';
import 'package:dokitamobile/app/modules/register_step/views/widgets/section_title.dart';
import 'package:dokitamobile/app/modules/register_step/controllers/register_step_controller.dart';

class MedecinBiographieStep extends GetView<RegisterStepController> {
  const MedecinBiographieStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Biographie", icon: Icons.edit_note),
          Gap(AppSizes.paddingMd),
          CustomTextInputField(
            hintText: "Parlez un peu de vous...",
            controller: controller.biographieController,
            maxLine: 20,
            validator: (value) => Validators.validateNotEmpty(value),
          ),
          Gap(AppSizes.paddingLg),
          
        ],
      ),
    );
  }
}
