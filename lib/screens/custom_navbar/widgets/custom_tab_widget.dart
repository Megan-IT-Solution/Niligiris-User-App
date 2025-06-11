import 'package:flutter/material.dart';

class CustomTabWidget extends StatelessWidget {
  final String image;
  final Function()? onPressed;
  final Color activeColor;
  const CustomTabWidget({
    super.key,
    required this.image,
    this.onPressed,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 25,
          width: 25,
          child: Image.asset(image, color: activeColor),
        ),
      ),
    );
  }
}
