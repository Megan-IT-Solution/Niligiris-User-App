import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/screens/custom_navbar/home/all_categories_screen.dart';
import 'package:nilgiris/screens/custom_navbar/home/widgets/banner_widget.dart';
import 'package:nilgiris/screens/custom_navbar/home/widgets/categories_widget.dart';
import 'package:nilgiris/screens/custom_navbar/home/widgets/featured_products_widget.dart';
import 'package:nilgiris/widgets/text_inputs.dart';

import '../../../constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            SearchTextInput(),
            const SizedBox(height: 20),
            BannerWidget(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(AllCategoriesScreen());
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            CategoriesWidget(),
            SizedBox(height: 20),
            Text(
              "Featured Products",
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),

            FeaturedProductsWidget(),
          ],
        ),
      ),
    );
  }
}
