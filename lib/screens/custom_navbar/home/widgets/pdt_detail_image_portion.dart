import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/models/product_model.dart';

class PdtDetailImagePortion extends StatelessWidget {
  final ProductModel productModel;
  const PdtDetailImagePortion({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.33,
      width: Get.width,
      child: Center(
        child: Image.asset(productModel.productImage, fit: BoxFit.contain),
      ),
    );
  }
}
