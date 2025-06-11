import 'package:flutter/material.dart';
import 'package:nilgiris/screens/custom_navbar/profile/notifications/widgets/notification_card_widget.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("Notifications", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            NotificationCardWidget(
              title: "Allow Notification",
              subTitle: "Let us keep you informed with\ntimely updates.",
            ),
            NotificationCardWidget(
              title: "Email Notification",
              subTitle: "Let us keep you informed with\ntimely updates.",
            ),
            NotificationCardWidget(
              title: "Orders Notification",
              subTitle: "Let us keep you informed with\ntimely updates.",
            ),
            NotificationCardWidget(
              title: "General Notification",
              subTitle: "Let us keep you informed with\ntimely updates.",
            ),
          ],
        ),
      ),
    );
  }
}
