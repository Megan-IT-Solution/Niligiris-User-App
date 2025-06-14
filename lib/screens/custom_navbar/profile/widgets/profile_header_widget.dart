import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: AppColors.primaryWhite,
      child: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/r.png'),
                  ),
                  Positioned(
                    bottom: -10,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "John Doe",
            style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "John.testing@gmail.com",
            style: AppTextStyles.h1.copyWith(color: AppColors.lightGrey),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
