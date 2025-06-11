import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../screens/auth/login_screen.dart';
import '../widgets/buttons.dart';

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

void showSignOutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: Image.asset('assets/icons/logout.png'),
              ),
              const SizedBox(height: 05),
              Text(
                'Are you Sure?',
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'You will be signed out of your account.',
                textAlign: TextAlign.center,
                style: AppTextStyles.h1,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: "Cancel",
                      btnColor: AppColors.primaryWhite,
                      borderColor: AppColors.primaryBlack,
                      titleColor: AppColors.primaryBlack,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: "Sign Out",
                      btnColor: Colors.redAccent,
                      borderColor: Colors.redAccent,
                      titleColor: AppColors.primaryWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
