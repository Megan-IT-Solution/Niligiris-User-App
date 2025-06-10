import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixWidget;
  final bool? isTextSecured;
  final TextInputType? textInputType;
  const CustomTextInput({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixWidget,
    this.isTextSecured,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: isTextSecured ?? false,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: AppColors.primaryWhite,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryWhite),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryWhite),
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: AppColors.lightGrey),
        suffixIcon: suffixWidget ?? SizedBox(),
        hintStyle: TextStyle(color: AppColors.lightGrey, fontSize: 15),
      ),
    );
  }
}

class SearchTextInput extends StatelessWidget {
  const SearchTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey.withValues(alpha: 0.2),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.search, color: AppColors.lightGrey),
        hintText: "Search Keyword...",
        hintStyle: AppTextStyles.h1.copyWith(color: AppColors.lightGrey),
      ),
    );
  }
}
