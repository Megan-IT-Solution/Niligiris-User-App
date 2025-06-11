import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';
import '../../../../controllers/cart_controller.dart';
import '../../../../utils/lists.dart';
import '../product_detail_screen.dart';

class FeaturedProductsWidget extends StatelessWidget {
  const FeaturedProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (_, index) {
            final product = productList[index];
            final isInCart = cartController.cartList.any(
              (item) => item.productId == product.productId,
            );

            return GestureDetector(
              onTap: () {
                Get.to(ProductDetailScreen(productModel: product));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: Image.asset(
                        product.productImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${product.price.toStringAsFixed(1)} AED/KG",
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product.productTitle,
                      style: AppTextStyles.h2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(color: AppColors.lightGrey),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4,
                      ),
                      child:
                          isInCart
                              ? Center(
                                child: Text(
                                  "In Cart",
                                  style: AppTextStyles.h1.copyWith(
                                    fontSize: 14,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                              : GestureDetector(
                                onTap: () {
                                  product.quantity = 1;
                                  cartController.addProductToCart(product);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                        AppAssets.cartIcon,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Add to Cart",
                                      style: AppTextStyles.h1.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
