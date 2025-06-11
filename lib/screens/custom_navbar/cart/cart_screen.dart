import 'package:flutter/material.dart';
import 'package:nilgiris/controllers/cart_controller.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/checkout_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/dismissible_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/empty_cart_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/increment_decrement_quantity_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/pdt_quantity_and_title_widget.dart';
import 'package:nilgiris/utils/custom_msgs.dart';
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

                        return DismissibleWidget(
                          product: product,
                          onConfirmDismiss: (direction) async {
                            cartController.removeProduct(product.productId);
                            return false;
                          },
                          child: Container(
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
                          ),
                        );
                      },
                    ),
                  ),
                  CheckOutWidget(
                    totalAmount: cartController
                        .getTotalAmount()
                        .toStringAsFixed(2),
                    onCheckOutClicked: () {
                      showCustomMsg(context, "Check Out Clicked");
                    },
                  ),
                ],
              ),
    );
  }
}
