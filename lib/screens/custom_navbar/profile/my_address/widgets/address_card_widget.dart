import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_text_styles.dart';

class AddressCardWidget extends StatelessWidget {
  const AddressCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(06),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFEBFFD7),
                  child: Center(child: Image.asset('assets/icons/address.png')),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Russel Austin",
                      style: AppTextStyles.h2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "7c Street Al Nabba, Sharjah \n+971 501231238",
                      style: AppTextStyles.h1.copyWith(
                        color: AppColors.lightGrey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
