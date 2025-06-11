import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class IncrementDecrementQuantityWidget extends StatelessWidget {
  final Function()? onIncrementClicked, onDecrementClicked;
  final String quantity;
  const IncrementDecrementQuantityWidget({
    super.key,
    this.onIncrementClicked,
    this.onDecrementClicked,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove_circle_outline,
            color: AppColors.primaryColor,
          ),
          onPressed: onDecrementClicked,
        ),
        Text(quantity, style: AppTextStyles.h2),
        IconButton(
          icon: Icon(Icons.add_circle_outline, color: AppColors.primaryColor),
          onPressed: onIncrementClicked,
        ),
      ],
    );
  }
}
