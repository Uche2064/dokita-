import 'package:dokitamobile/app/translations/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NextIcon extends StatelessWidget {
  const NextIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppText.suivant,
          style: Get.textTheme.bodyLarge!.copyWith(color: Colors.white),
        ),
        Gap(4.h), // espace entre le texte et l'icône
        FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white, size: 18.h),
      ],
    );
  }
}
