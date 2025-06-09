import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../screens/auth/login_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';

class AppDialogs {
  static showEmailConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.mark_email_read_outlined,
                    size: 60,
                    color: Colors.green,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Email Sent!",
                    style: AppTextStyles.h1.copyWith(fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We’ve sent a password reset link to your email. Please check it to change your password.",
                    style: AppTextStyles.h1.copyWith(
                      fontSize: 15,
                      color: AppColors.lightGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  PrimaryButton(
                    title: "Back",
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.offAll(LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
