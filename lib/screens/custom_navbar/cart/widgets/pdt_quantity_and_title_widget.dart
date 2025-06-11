import 'package:flutter/material.dart';
import 'package:nilgiris/models/product_model.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class PdtQuantityAndTitleWidget extends StatelessWidget {
  final ProductModel product;
  const PdtQuantityAndTitleWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${product.price.toStringAsFixed(2)} x ${product.quantity}",
            style: AppTextStyles.h1.copyWith(
              fontSize: 14,
              color: AppColors.lightGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            product.productTitle,
            style: AppTextStyles.h2.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
