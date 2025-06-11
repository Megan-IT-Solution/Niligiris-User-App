import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color? btnColor, titleColor;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.btnColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btnColor ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: titleColor ?? AppColors.primaryWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Color? btnColor, borderColor, titleColor;
  final String title;
  final Function()? onPressed;
  const SecondaryButton({
    super.key,
    this.btnColor,
    this.borderColor,
    required this.title,
    this.onPressed,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor!),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.h1.copyWith(
          color: titleColor ?? AppColors.primaryColor,
        ),
      ),
    );
  }
}
