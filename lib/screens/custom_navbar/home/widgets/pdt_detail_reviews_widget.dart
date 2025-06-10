import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class PdtDetailReviewsWidget extends StatelessWidget {
  const PdtDetailReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("4.5", style: AppTextStyles.h1),
        SizedBox(width: 05),
        Icon(Icons.grade, size: 20, color: Colors.amber),
        Icon(Icons.grade, size: 20, color: Colors.amber),
        Icon(Icons.grade, size: 20, color: Colors.amber),
        Icon(Icons.grade, size: 20, color: Colors.amber),
        Icon(Icons.grade_outlined, size: 20, color: Colors.amber),
        SizedBox(width: 05),
        Text(
          "(40 Reviews)",
          style: AppTextStyles.h1.copyWith(color: AppColors.lightGrey),
        ),
      ],
    );
  }
}
