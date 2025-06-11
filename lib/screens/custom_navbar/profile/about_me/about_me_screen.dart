import 'package:flutter/material.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/widgets/text_inputs.dart';

import '../../../../widgets/buttons.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,

      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("About Me", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Details",
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              CustomTextInput(
                hintText: "Russel Austin",
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 10),
              CustomTextInput(
                hintText: "russel.austin@nilgiris.ae",
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: 10),

              CustomTextInput(hintText: "052 1231239", prefixIcon: Icons.phone),

              SizedBox(height: 30),
              Text(
                "Change Password",
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              CustomTextInput(
                hintText: "Current Password",
                prefixIcon: Icons.lock,
              ),
              SizedBox(height: 10),
              CustomTextInput(hintText: "New Password", prefixIcon: Icons.lock),
              SizedBox(height: 10),

              CustomTextInput(
                hintText: "Confirm Password",
                prefixIcon: Icons.lock,
              ),
              SizedBox(height: 50),
              PrimaryButton(title: "Save Changes"),
            ],
          ),
        ),
      ),
    );
  }
}
