import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class PaymentMethodSelectionWidget extends StatelessWidget {
  final Map<String, String?> method;
  final bool isSelected;
  const PaymentMethodSelectionWidget({
    super.key,
    required this.method,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(12),
      width: 110,
      height: 100,
      decoration: BoxDecoration(
        color:
            isSelected
                ? AppColors.primaryColor.withValues(alpha: 0.1)
                : AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          method['image'] != null
              ? Image.asset(
                method['image']!,
                height: 30,
                width: 50,
                fit: BoxFit.contain,
              )
              : Icon(Icons.money, size: 30),
          SizedBox(height: 8),
          Text(
            method['title']!,
            style: AppTextStyles.h2.copyWith(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primaryBlack : AppColors.lightGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
