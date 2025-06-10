import 'package:flutter/material.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';
import '../../../../utils/lists.dart';

class FeaturedProductsWidget extends StatefulWidget {
  const FeaturedProductsWidget({super.key});

  @override
  State<FeaturedProductsWidget> createState() => _FeaturedProductsWidgetState();
}

class _FeaturedProductsWidgetState extends State<FeaturedProductsWidget> {
  Map<int, int> cartQuantities = {};

  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
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
        final bool isInCart = cartQuantities.containsKey(index);
        final int quantity = cartQuantities[index] ?? 0;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatefulBuilder(
                builder: (context, newSetState) {
                  return Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 08,
                        vertical: 02,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          newSetState(() {
                            _isLiked = !_isLiked;
                          });
                        },
                        child: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : AppColors.lightGrey,
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(
                height: 80,
                width: 150,
                child: Image.asset(product.productImage, fit: BoxFit.contain),
              ),
              SizedBox(height: 05),
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
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
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
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (cartQuantities[index]! > 1) {
                                    cartQuantities[index] =
                                        cartQuantities[index]! - 1;
                                  } else {
                                    cartQuantities.remove(index);
                                  }
                                });
                              },

                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: AppColors.primaryColor,
                              ),
                            ),

                            Text(quantity.toString(), style: AppTextStyles.h1),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartQuantities[index] = quantity + 1;
                                });
                              },

                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        )
                        : GestureDetector(
                          onTap: () {
                            setState(() {
                              cartQuantities[index] = 1;
                            });
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
                                style: AppTextStyles.h1.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
              ),
            ],
          ),
        );
      },
    );
  }
}
