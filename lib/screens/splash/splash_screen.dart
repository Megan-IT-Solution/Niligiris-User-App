import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/screens/onboarding/onboarding_screen.dart';
import 'package:nilgiris/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.offAll(OnboardingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: LogoWidget(height: 300, width: 400)));
  }
}
