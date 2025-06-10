import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class PdtDetailQuantityIncrementDecrementWidget extends StatelessWidget {
  final int quantity;
  final Function()? onMinusClicked, onAddClicked;
  const PdtDetailQuantityIncrementDecrementWidget({
    super.key,
    required this.quantity,
    this.onMinusClicked,
    this.onAddClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text("Quantity"),
            Spacer(),
            GestureDetector(
              onTap: onMinusClicked,
              child: Icon(Icons.remove, color: AppColors.primaryColor),
            ),
            SizedBox(width: 15),
            Container(height: 50, width: 1, color: AppColors.lightGrey),
            SizedBox(width: 20),
            Text(quantity.toString(), style: AppTextStyles.h2),
            SizedBox(width: 20),
            Container(height: 50, width: 1, color: AppColors.lightGrey),
            SizedBox(width: 15),
            GestureDetector(
              onTap: onAddClicked,
              child: Icon(Icons.add, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
