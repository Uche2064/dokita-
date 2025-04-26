import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({super.key, required this.icon, required this.title});
  final String title;
  IconData icon;
  final color = Get.theme.colorScheme;
  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(icon, color: color.primary),
        Gap(8),
        Text(
          title,
          style: Get.textTheme.bodyMedium!.copyWith(color: color.primary),
        ),
      ],
    );
  }
}
