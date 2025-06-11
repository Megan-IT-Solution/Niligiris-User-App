import 'package:flutter/material.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/screens/custom_navbar/profile/widgets/profile_header_widget.dart';
import 'package:nilgiris/screens/custom_navbar/profile/widgets/profile_tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ProfileHeaderWidget(),
            SizedBox(height: 40),
            ProfileTileWidget(icon: "about", title: "About Me"),
            ProfileTileWidget(icon: "orders", title: "My Orders"),
            ProfileTileWidget(icon: "favorite", title: "My Favorites"),
            ProfileTileWidget(icon: "address", title: "My Address"),
            ProfileTileWidget(icon: "notification", title: "Notifications"),
            ProfileTileWidget(icon: "logout", title: "Sign Out"),
          ],
        ),
      ),
    );
  }
}
