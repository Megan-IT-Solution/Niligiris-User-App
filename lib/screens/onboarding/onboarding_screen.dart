import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/screens/first_screen/first_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/lists.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pages[index]['title']!,
                      style: AppTextStyles.onboardingMain,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      pages[index]['slogan']!,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      pages[index]['image']!,
                      height: Get.height * 0.4,
                      width: Get.width,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: pages.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: PrimaryButton(
              onPressed: () {
                if (currentPage == pages.length - 1) {
                  Get.offAll(FirstScreen());
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              title: currentPage == pages.length - 1 ? 'Get Started' : 'Next',
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color? btnColor, titleColor;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.btnColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btnColor ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: titleColor ?? AppColors.primaryWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
