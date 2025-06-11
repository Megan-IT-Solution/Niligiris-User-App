import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_assets.dart';
import 'package:nilgiris/controllers/switch_controller.dart';
import 'package:nilgiris/controllers/visibility_controller.dart';
import 'package:nilgiris/screens/auth/forgot_password_screen.dart';
import 'package:nilgiris/screens/auth/sign_up_screen.dart';
import 'package:nilgiris/screens/auth/widgets/auth_footer.dart';
import 'package:nilgiris/screens/auth/widgets/remember_me_and_forgot_pass_portion.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../widgets/buttons.dart';
import '../../widgets/text_inputs.dart';
import '../custom_navbar/custom_navbar_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.45,
              width: Get.width,
              child: Image.asset(AppAssets.female, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome", style: AppTextStyles.authHeading),
                    Text(
                      "Sign in to your account",
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
                    SizedBox(height: 15),
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
                    Consumer<SwitchController>(
                      builder: (context, switchController, child) {
                        return RememberMeAndForgotPassPortion(
                          onForgotPasswordPressed: () {
                            Get.to(ForgotPasswordScreen());
                          },
                          switchValue: switchController.isSwitchActive,
                          onSwitchPressed: (v) {
                            switchController.makeSwitchActiveOrInActive(v);
                          },
                        );
                      },
                    ),

                    SizedBox(height: 20),
                    PrimaryButton(
                      onPressed: () {
                        Get.offAll(CustomNavbarScreen());
                      },
                      title: "Log In",
                    ),
                    SizedBox(height: 30),
                    AuthFooter(
                      onPressed: () {
                        Get.offAll(SignUpScreen());
                      },
                      title: "Don't have an account?",
                      subTitle: "Sign Up",
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
