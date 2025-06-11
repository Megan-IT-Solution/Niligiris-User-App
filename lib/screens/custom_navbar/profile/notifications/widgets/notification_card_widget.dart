import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_text_styles.dart';

class NotificationCardWidget extends StatelessWidget {
  final String title, subTitle;
  const NotificationCardWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.primaryWhite,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  subTitle,
                  style: AppTextStyles.h1.copyWith(
                    color: AppColors.lightGrey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Spacer(),
            Switch(
              value: false,
              onChanged: (v) {},
              activeColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
