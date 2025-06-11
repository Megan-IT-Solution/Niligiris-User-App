import 'package:flutter/material.dart';
import 'package:nilgiris/controllers/cart_controller.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/empty_cart_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/increment_decrement_quantity_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/pdt_quantity_and_title_widget.dart';
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
              ? EmptyCartWidget()
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
                                height: 70,
                                width: 70,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 12),
                              PdtQuantityAndTitleWidget(product: product),
                              IncrementDecrementQuantityWidget(
                                quantity: product.quantity.toString(),
                                onDecrementClicked: () {
                                  cartController.decrementQuantity(
                                    product.productId,
                                  );
                                },
                                onIncrementClicked: () {
                                  cartController.incrementQuantity(
                                    product.productId,
                                  );
                                },
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
