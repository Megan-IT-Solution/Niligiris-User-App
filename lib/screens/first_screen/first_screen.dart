import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_assets.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/screens/auth/login_screen.dart';
import 'package:nilgiris/screens/onboarding/onboarding_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite.withValues(alpha: 0.9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.55,
            width: Get.width,
            child: Image.asset(AppAssets.female, fit: BoxFit.cover),
          ),
          SizedBox(height: 15),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome", style: AppTextStyles.authHeading),
                  SizedBox(height: 5),
                  Text(
                    "Create your account if you are new user or login to your existing account",
                    style: AppTextStyles.authHeading.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  SizedBox(height: 30),
                  PrimaryButton(
                    title: "Create your account",
                    btnColor: AppColors.primaryWhite,
                    titleColor: AppColors.primaryBlack,
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    onPressed: () {
                      Get.offAll(LoginScreen());
                    },
                    title: "Login to Existing Account",
                    btnColor: AppColors.primaryColor,
                    titleColor: AppColors.primaryWhite,
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
