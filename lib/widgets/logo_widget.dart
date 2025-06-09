


import 'package:flutter/material.dart';
import 'package:nilgiris/constants/app_assets.dart';
class LogoWidget extends StatelessWidget {
  final double? height,width;
  const LogoWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 100,
      width: width ?? 200,
      child: Image.asset(AppAssets.appLogo),
    );
  }
}
