import 'package:flutter/material.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/screens/custom_navbar/profile/my_orders/widgets/order_card_widget.dart';

import '../../../../constants/app_text_styles.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("My Orders", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [OrderCardWidget(), OrderCardWidget(), OrderCardWidget()],
        ),
      ),
    );
  }
}
