import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';
import '../../../../widgets/buttons.dart';

class CheckOutWidget extends StatelessWidget {
  final String totalAmount;
  final Function()? onCheckOutClicked;
  const CheckOutWidget({
    super.key,
    required this.totalAmount,
    this.onCheckOutClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryWhite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub Total",
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.lightGrey,
                  fontSize: 15,
                ),
              ),
              Text(
                "$totalAmount AED",
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          PrimaryButton(onPressed: onCheckOutClicked, title: "Checkout"),
        ],
      ),
    );
  }
}
