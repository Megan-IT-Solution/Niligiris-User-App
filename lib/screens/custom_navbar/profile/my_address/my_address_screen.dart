import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/screens/custom_navbar/profile/my_address/add_address_screen.dart';
import 'package:nilgiris/screens/custom_navbar/profile/my_address/widgets/address_card_widget.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("My Address", style: AppTextStyles.h2),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(AddAddressScreen());
            },
            child: Icon(Icons.add_circle_outline, size: 25),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [AddressCardWidget()]),
      ),
    );
  }
}
