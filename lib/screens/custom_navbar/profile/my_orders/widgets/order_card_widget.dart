import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_text_styles.dart';

class OrderCardWidget extends StatefulWidget {
  const OrderCardWidget({super.key});

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  bool _showOrderDetails = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Color(0xFFEBFFD7),
                  child: Center(child: Image.asset('assets/icons/orders.png')),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #98997",
                      style: AppTextStyles.h2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Place on June 11 2025",
                      style: AppTextStyles.h1.copyWith(
                        color: AppColors.lightGrey,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Items: 10",
                          style: AppTextStyles.h1.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "Total: 105 AED",
                          style: AppTextStyles.h1.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showOrderDetails = !_showOrderDetails;
                    });
                  },
                  child: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: AppColors.primaryColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: 05),
            Divider(),
            Row(
              children: [
                Text(
                  "Status: ",
                  style: AppTextStyles.h1.copyWith(fontSize: 13),
                ),
                Text(
                  "Delivered",
                  style: AppTextStyles.h1.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightGrey,
                  ),
                ),
                Spacer(),
                Text(
                  "June 13 2025",
                  style: AppTextStyles.h2.copyWith(fontSize: 14),
                ),
              ],
            ),
            Visibility(
              visible: _showOrderDetails,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  const SizedBox(height: 8),
                  Text("• Item: Pineapple"),
                  Text("• Quantity: 2"),
                  Text("• Total: 10 AED"),
                  Text("• Status: Delivered"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
