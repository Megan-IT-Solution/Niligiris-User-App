import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class AuthFooter extends StatelessWidget {
  final String title, subTitle;
  final Function()? onPressed;
  const AuthFooter({
    super.key,
    required this.title,
    required this.subTitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$title ",
            style: AppTextStyles.h1.copyWith(color: AppColors.lightGrey),
          ),
          Text(subTitle, style: AppTextStyles.h1),
        ],
      ),
    );
  }
}
