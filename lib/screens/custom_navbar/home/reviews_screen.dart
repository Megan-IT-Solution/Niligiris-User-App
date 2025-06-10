import 'package:flutter/material.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/screens/custom_navbar/home/review_card.dart';

import '../../../constants/app_colors.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("Reviews", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReviewCard(),
              ReviewCard(),
              ReviewCard(),
              ReviewCard(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
