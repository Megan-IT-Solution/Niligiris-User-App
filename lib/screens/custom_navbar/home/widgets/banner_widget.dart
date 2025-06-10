import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0;

  final List<String> imageUrls = [
    'assets/images/ad.png',
    'assets/images/ad.png',
    'assets/images/ad.png',
    'assets/images/ad.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.97,
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items:
              imageUrls.map((url) {
                return Image.asset(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          child: Row(
            children:
                imageUrls.asMap().entries.map((entry) {
                  bool isActive = _currentIndex == entry.key;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isActive ? 30.0 : 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color:
                          isActive
                              ? AppColors.primaryColor
                              : AppColors.primaryWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
