import 'package:flutter/material.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/screens/custom_navbar/home/widgets/banner_widget.dart';
import 'package:nilgiris/utils/lists.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextInput(),
              const SizedBox(height: 20),
              BannerWidget(),
              SizedBox(height: 20),
              Text(
                "Categories",
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 65,
                            width: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  categoryColors[index % categoryColors.length],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(categories[index].icon),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 90,
                            height: 33,
                            child: Text(
                              categories[index].title,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.h1.copyWith(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
