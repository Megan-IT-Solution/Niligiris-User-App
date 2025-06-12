import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/controllers/cart_controller.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/credit_card_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/delivery_address_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/order_summary_row_widget.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/payment_method_selection_widget.dart';
import 'package:nilgiris/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../../utils/lists.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPaymentMethod = 'RAK Bank';

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("Checkout", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DeliveryAddressWidget(),

            SizedBox(height: 20),
            Text(
              "Payment Methods",
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    paymentMethods.map((method) {
                      final isSelected =
                          _selectedPaymentMethod == method['title'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPaymentMethod = method['title']!;
                          });
                        },
                        child: PaymentMethodSelectionWidget(
                          method: method,
                          isSelected: isSelected,
                        ),
                      );
                    }).toList(),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Order Summary",
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  orderSummaryWidget(
                    "Subtotal",
                    "${cartController.getTotalAmount().toStringAsFixed(2)} AED",
                  ),
                  SizedBox(height: 6),
                  orderSummaryWidget("Delivery", "5.00 AED"),
                  Divider(height: 20),
                  orderSummaryWidget(
                    "Total",
                    "${(cartController.getTotalAmount() + 5).toStringAsFixed(2)} AED",
                    isBold: true,
                  ),
                ],
              ),
            ),

            Spacer(),

            PrimaryButton(
              title: "Place Order",
              onPressed: () {
                if (_selectedPaymentMethod == "RAK Bank" ||
                    _selectedPaymentMethod == "Stripe") {
                  creditCardWidget(context);
                } else {
                  Get.defaultDialog(
                    title: "Order Confirmed",
                    middleText: "Payment Method: $_selectedPaymentMethod",
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                      Get.back();
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
