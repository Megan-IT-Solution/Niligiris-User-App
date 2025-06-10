import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 20),
      color: AppColors.primaryWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/r.png'),
              ),
              title: Text(
                "Haylie Aminoff",
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "32 Minutes ago",
                style: AppTextStyles.h1.copyWith(
                  fontSize: 13,
                  color: AppColors.lightGrey,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Text("4.5", style: AppTextStyles.h1),
                SizedBox(width: 10),
                Icon(Icons.grade, color: Colors.amber, size: 22),
                Icon(Icons.grade, color: Colors.amber, size: 22),
                Icon(Icons.grade, color: Colors.amber, size: 22),
                Icon(Icons.grade, color: Colors.amber, size: 22),
                Icon(Icons.star_half, color: Colors.amber, size: 22),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "I like the Service of this company, so Fast reached properly and the item is okay ",
              style: AppTextStyles.h1.copyWith(
                fontSize: 13,
                color: AppColors.lightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
