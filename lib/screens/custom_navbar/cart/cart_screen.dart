import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_assets.dart';
import 'package:nilgiris/controllers/cart_controller.dart';
import 'package:nilgiris/screens/custom_navbar/custom_navbar_screen.dart';
import 'package:nilgiris/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("Shopping Cart", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body:
          cartController.cartList.isEmpty
              ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 150,
                        child: Image.asset(
                          AppAssets.cartIcon,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Your Cart Is Empty!",
                        style: AppTextStyles.h2.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 40),
                      PrimaryButton(
                        onPressed: () {
                          Get.offAll(CustomNavbarScreen());
                        },
                        title: "Start Shopping",
                      ),
                    ],
                  ),
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartController.cartList.length,
                      itemBuilder: (context, index) {
                        final product = cartController.cartList[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                product.productImage,
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.productTitle,
                                      style: AppTextStyles.h2.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "${product.price.toStringAsFixed(2)} AED",
                                      style: AppTextStyles.h2.copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove_circle_outline,
                                      color: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      cartController.decrementQuantity(
                                        product.productId,
                                      );
                                    },
                                  ),
                                  Text(
                                    product.quantity.toString(),
                                    style: AppTextStyles.h2,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      cartController.incrementQuantity(
                                        product.productId,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: AppColors.primaryWhite,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub Total",
                              style: AppTextStyles.h2.copyWith(
                                color: AppColors.lightGrey,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "${cartController.getTotalAmount().toStringAsFixed(2)} AED",
                              style: AppTextStyles.h2.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        PrimaryButton(
                          onPressed: () {
                            // Implement checkout navigation
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Proceeding to checkout..."),
                              ),
                            );
                          },
                          title: "Checkout",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
