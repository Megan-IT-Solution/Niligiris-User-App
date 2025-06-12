import 'package:flutter/material.dart';
import 'package:nilgiris/models/product_model.dart';

class WishlistController extends ChangeNotifier {
  final List<ProductModel> _wishlist = [];

  List<ProductModel> get wishlist => _wishlist;

  void toggleWishlist(ProductModel product) {
    final index = _wishlist.indexWhere(
      (item) => item.productId == product.productId,
    );
    if (index == -1) {
      _wishlist.add(product);
    } else {
      _wishlist.removeAt(index);
    }
    notifyListeners();
  }

  bool isInWishlist(ProductModel product) {
    return _wishlist.any((item) => item.productId == product.productId);
  }
}
