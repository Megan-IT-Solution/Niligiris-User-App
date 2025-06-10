import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';

class CartTabWidget extends StatelessWidget {
  final Function()? onPressed;
  const CartTabWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 20),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(AppAssets.cartIcon, color: AppColors.primaryWhite),
        ),
      ),
    );
  }
}
