import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.45,
            width: Get.width,
            child: Image.asset(AppAssets.female, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
