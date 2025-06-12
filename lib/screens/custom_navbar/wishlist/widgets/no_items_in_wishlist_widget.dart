import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class NoItemInWishlistWidget extends StatelessWidget {
  const NoItemInWishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 140,
            width: 200,
            child: Image.asset(
              'assets/icons/wish.png',
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "No items Found in your\nwishlist",
            textAlign: TextAlign.center,
            style: AppTextStyles.h2.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
