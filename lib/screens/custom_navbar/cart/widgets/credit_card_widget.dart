import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/cart_controller.dart';

void creditCardWidget(BuildContext context) {
  bool isProcessing = false;

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CreditCardWidget(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                      isHolderNameVisible: true,
                      cardBgColor: AppColors.primaryColor,
                      onCreditCardWidgetChange: (CreditCardBrand brand) {},
                    ),
                    CreditCardForm(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: (CreditCardModel model) {
                        setState(() {
                          cardNumber = model.cardNumber;
                          expiryDate = model.expiryDate;
                          cardHolderName = model.cardHolderName;
                          cvvCode = model.cvvCode;
                          isCvvFocused = model.isCvvFocused;
                        });
                      },
                      formKey: GlobalKey<FormState>(),
                      cvvValidationMessage: 'Please input a valid CVV',
                      dateValidationMessage: 'Please input a valid date',
                      numberValidationMessage: 'Please input a valid number',
                    ),
                    SizedBox(height: 20),

                    Consumer<CartController>(
                      builder: (context, cartController, child) {
                        return isProcessing
                            ? PrimaryButton(title: "Please Wait......")
                            : PrimaryButton(
                              title: "Pay Now",
                              onPressed: () async {
                                setState(() => isProcessing = true);

                                await Future.delayed(Duration(seconds: 3));

                                cartController.clearCart();
                                Get.back();

                                await Future.delayed(
                                  Duration(milliseconds: 300),
                                );

                                Get.defaultDialog(
                                  title: "",
                                  contentPadding: EdgeInsets.all(20),
                                  content: Column(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: AppColors.primaryColor,
                                        size: 60,
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        "Order Placed!",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Thank you for shopping with us. Your order has been successfully placed.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                          Get.back();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: 12,
                                          ),
                                          child: Text(
                                            "Back to Home",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );

                                setState(() => isProcessing = false);
                              },
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
