import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/screens/custom_navbar/profile/about_me/about_me_screen.dart';
import 'package:nilgiris/screens/custom_navbar/profile/my_address/my_address_screen.dart';
import 'package:nilgiris/screens/custom_navbar/profile/my_orders/my_orders_screen.dart';
import 'package:nilgiris/screens/custom_navbar/profile/notifications/notification_settings_screen.dart';
import 'package:nilgiris/screens/custom_navbar/profile/widgets/profile_header_widget.dart';
import 'package:nilgiris/screens/custom_navbar/profile/widgets/profile_tile_widget.dart';
import 'package:nilgiris/utils/dialogs.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          ProfileHeaderWidget(),
          SizedBox(height: 40),
          ProfileTileWidget(
            onPressed: () {
              Get.to(AboutMeScreen());
            },
            icon: "about",
            title: "About Me",
          ),
          ProfileTileWidget(
            onPressed: () {
              Get.to(MyOrdersScreen());
            },
            icon: "orders",
            title: "My Orders",
          ),
          ProfileTileWidget(icon: "favorite", title: "My Favorites"),
          ProfileTileWidget(
            onPressed: () {
              Get.to(MyAddressScreen());
            },
            icon: "address",
            title: "My Address",
          ),
          ProfileTileWidget(
            onPressed: () {
              Get.to(NotificationSettingsScreen());
            },
            icon: "notification",
            title: "Notifications",
          ),
          ProfileTileWidget(
            onPressed: () => showSignOutDialog(context),
            icon: "logout",
            title: "Sign Out",
          ),
        ],
      ),
    );
  }
}
