import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class ProfileTileWidget extends StatelessWidget {
  final String icon, title;
  final Function()? onPressed;
  const ProfileTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            SizedBox(
              height: 22,
              width: 22,
              child: Image.asset('assets/icons/$icon.png'),
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: AppTextStyles.h1.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.lightGrey),
          ],
        ),
      ),
    );
  }
}
