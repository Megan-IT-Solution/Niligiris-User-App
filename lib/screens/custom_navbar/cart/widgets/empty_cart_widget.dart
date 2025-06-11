import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';
import '../../../../widgets/buttons.dart';
import '../../custom_navbar_screen.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 150,
              child: Image.asset(
                AppAssets.cartIcon,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Your Cart Is Empty!",
              style: AppTextStyles.h2.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 40),
            PrimaryButton(
              onPressed: () {
                Get.offAll(CustomNavbarScreen());
              },
              title: "Start Shopping",
            ),
          ],
        ),
      ),
    );
  }
}
