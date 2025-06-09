import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/screens/auth/login_screen.dart';
import 'package:nilgiris/screens/auth/widgets/auth_footer.dart';
import 'package:provider/provider.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../controllers/visibility_controller.dart';
import '../../widgets/text_inputs.dart';
import '../onboarding/onboarding_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.43,
              width: Get.width,
              child: Image.asset(AppAssets.female2, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create Account", style: AppTextStyles.authHeading),
                    Text(
                      "Quickly Create account",
                      style: AppTextStyles.authHeading.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextInput(
                      hintText: "Email",
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: 12),
                    CustomTextInput(
                      textInputType: TextInputType.number,
                      hintText: "Phone Number",
                      prefixIcon: Icons.phone,
                    ),
                    SizedBox(height: 12),
                    Consumer<VisibilityController>(
                      builder: (context, visibilityController, child) {
                        return CustomTextInput(
                          isTextSecured: visibilityController.isVisible,
                          hintText: "Password",
                          prefixIcon: Icons.lock_open_rounded,
                          suffixWidget: GestureDetector(
                            onTap: () {
                              visibilityController.setVisibility();
                            },
                            child: Icon(
                              visibilityController.isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    PrimaryButton(title: "Sign Up"),
                    SizedBox(height: 30),
                    AuthFooter(
                      onPressed: () {
                        Get.offAll(LoginScreen());
                      },
                      title: "Already have an account?",
                      subTitle: "Log In",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
