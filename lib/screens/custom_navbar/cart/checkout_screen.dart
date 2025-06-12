import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/controllers/cart_controller.dart';
import 'package:nilgiris/screens/custom_navbar/cart/widgets/credit_card_widget.dart';
import 'package:nilgiris/widgets/buttons.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPaymentMethod = 'RAK Bank';

  final paymentMethods = [
    {'title': 'RAK Bank', 'image': 'assets/icons/rak.png'},
    {'title': 'Stripe', 'image': 'assets/icons/stripe.png'},
    {'title': 'Cash On Delivery', 'image': null},
  ];

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
            Text("Delivery Address", style: AppTextStyles.h1),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "John Doe\nStreet 123, Dubai\n+971 50 123 4567",
                style: AppTextStyles.h2,
              ),
            ),

            SizedBox(height: 20),
            Text("Payment Method", style: AppTextStyles.h1),
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
                        child: Container(
                          margin: EdgeInsets.only(right: 12),
                          padding: EdgeInsets.all(12),
                          width: 110,
                          height: 90,
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppColors.primaryColor.withOpacity(0.1)
                                    : AppColors.primaryWhite,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppColors.primaryColor
                                      : Colors.grey.shade300,
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              method['image'] != null
                                  ? Image.asset(
                                    method['image']!,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  )
                                  : Icon(Icons.money, size: 30),
                              SizedBox(height: 8),
                              Text(
                                method['title']!,
                                style: AppTextStyles.h2.copyWith(
                                  fontSize: 13,
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  color:
                                      isSelected
                                          ? AppColors.primaryColor
                                          : Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),

            SizedBox(height: 20),
            Text("Order Summary", style: AppTextStyles.h1),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _summaryRow(
                    "Subtotal",
                    "${cartController.getTotalAmount().toStringAsFixed(2)} AED",
                  ),
                  SizedBox(height: 6),
                  _summaryRow("Delivery", "5.00 AED"),
                  Divider(height: 20),
                  _summaryRow(
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

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    final textStyle = isBold ? AppTextStyles.h1 : AppTextStyles.h2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label, style: textStyle), Text(value, style: textStyle)],
    );
  }
}
