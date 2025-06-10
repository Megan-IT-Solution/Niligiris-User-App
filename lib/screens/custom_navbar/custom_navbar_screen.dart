import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_assets.dart';
import 'package:nilgiris/screens/custom_navbar/cart/cart_screen.dart';
import 'package:nilgiris/screens/custom_navbar/widgets/cart_tab_widget.dart';
import 'package:nilgiris/screens/custom_navbar/widgets/custom_tab_widget.dart';
import 'package:nilgiris/utils/lists.dart';

import '../../constants/app_colors.dart';

class CustomNavbarScreen extends StatefulWidget {
  const CustomNavbarScreen({super.key});

  @override
  State<CustomNavbarScreen> createState() => _CustomNavbarScreenState();
}

class _CustomNavbarScreenState extends State<CustomNavbarScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bottom.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTabWidget(
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                image: AppAssets.homeIcon,
                activeColor:
                    _currentIndex == 0
                        ? AppColors.primaryBlack
                        : AppColors.lightGrey,
              ),
              CustomTabWidget(
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                image: AppAssets.wishlistIcon,
                activeColor:
                    _currentIndex == 1
                        ? AppColors.primaryBlack
                        : AppColors.lightGrey,
              ),
              CustomTabWidget(
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                image: AppAssets.profileIcon,
                activeColor:
                    _currentIndex == 2
                        ? AppColors.primaryBlack
                        : AppColors.lightGrey,
              ),
              CartTabWidget(
                onPressed: () {
                  Get.to(CartScreen());
                },
              ),
            ],
          ),
        ),
      ),
      body: screens[_currentIndex],
    );
  }
}
