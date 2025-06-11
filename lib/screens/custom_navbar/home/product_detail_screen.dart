import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/models/product_model.dart';
import 'package:nilgiris/screens/custom_navbar/home/widgets/pdt_detail_image_portion.dart';
import 'package:nilgiris/screens/custom_navbar/home/widgets/pdt_detail_quantity_increment_decrement_widget.dart';
import 'package:nilgiris/screens/custom_navbar/home/widgets/pdt_detail_reviews_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/buttons.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailScreen({super.key, required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            PdtDetailImagePortion(productModel: widget.productModel),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.productModel.price} AED/KG",
                            style: AppTextStyles.h1.copyWith(
                              color: Color(0xFF28B446),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: AppColors.lightGrey,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.productModel.productTitle,
                        style: AppTextStyles.h2.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      PdtDetailReviewsWidget(),
                      SizedBox(height: 10),
                      Text(
                        widget.productModel.description,
                        style: AppTextStyles.h2.copyWith(
                          fontSize: 13,
                          color: Color(0xFF868889),
                        ),
                      ),
                      SizedBox(height: 20),
                      PdtDetailQuantityIncrementDecrementWidget(
                        quantity: _count,
                        onMinusClicked: () {
                          if (_count <= 1) {
                            setState(() {
                              _count = 1;
                            });
                          } else {
                            setState(() {
                              _count--;
                            });
                          }
                        },
                        onAddClicked: () {
                          setState(() {
                            _count++;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      PrimaryButton(onPressed: () {}, title: "Add To Cart"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
