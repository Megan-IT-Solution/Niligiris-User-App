import 'package:flutter/material.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/screens/onboarding/onboarding_screen.dart';
import 'package:nilgiris/utils/dialogs.dart';
import 'package:nilgiris/widgets/text_inputs.dart';

import '../../constants/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),

      appBar: AppBar(
        backgroundColor: Color(0xFFF4F5F9),
        title: Text("Password Recovery", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "Password Recovery",
                style: AppTextStyles.h1.copyWith(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Enter your email address to get password reset link and change your password",
              textAlign: TextAlign.center,
              style: AppTextStyles.h1.copyWith(
                fontSize: 15,
                color: AppColors.lightGrey,
              ),
            ),
            SizedBox(height: 30),
            CustomTextInput(
              hintText: "Email",
              prefixIcon: Icons.email_outlined,
            ),
            SizedBox(height: 40),
            PrimaryButton(
              title: "Reset",
              onPressed: () {
                AppDialogs.showEmailConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
