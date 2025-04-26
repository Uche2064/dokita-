import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dokitamobile/app/constants/app_sizes.dart';

class CustomTextInputField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int? maxLine;

  const CustomTextInputField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    required this.controller,
    this.validator,
    this.suffixIcon,
    this.maxLine,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLine ?? 1,
      
      validator: validator,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: GoogleFonts.roboto(fontSize: AppSizes.fontSizeMedium),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
