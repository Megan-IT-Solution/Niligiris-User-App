import 'package:flutter/material.dart';
import 'package:nilgiris/constants/app_colors.dart';
import 'package:nilgiris/constants/app_text_styles.dart';
import 'package:nilgiris/controllers/wishlist_controller.dart';
import 'package:nilgiris/models/product_model.dart';
import 'package:nilgiris/screens/custom_navbar/wishlist/widgets/no_items_in_wishlist_widget.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = Provider.of<WishlistController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("My Wishlist", style: AppTextStyles.h2),
        centerTitle: true,
      ),
      backgroundColor: AppColors.bgColor,
      body:
          wishlistController.wishlist.isEmpty
              ? NoItemInWishlistWidget()
              : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: wishlistController.wishlist.length,
                itemBuilder: (context, index) {
                  ProductModel product = wishlistController.wishlist[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        product.productImage,
                        height: 50,
                        width: 50,
                      ),
                      title: Text(
                        product.productTitle,
                        style: AppTextStyles.h2,
                      ),
                      subtitle: Text("${product.price} AED/KG"),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          wishlistController.toggleWishlist(product);
                        },
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
