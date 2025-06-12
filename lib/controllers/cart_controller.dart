import 'package:flutter/foundation.dart';
import 'package:nilgiris/models/product_model.dart';

class CartController extends ChangeNotifier {
  final List<ProductModel> _cartList = [];

  List<ProductModel> get cartList => _cartList;

  void addProductToCart(ProductModel product) {
    final index = _cartList.indexWhere(
      (item) => item.productId == product.productId,
    );

    if (index == -1) {
      _cartList.add(product);
      if (kDebugMode) print("Added to Cart: ${product.productTitle}");
    } else {
      _cartList[index].quantity += 1;
      if (kDebugMode) print("Increased quantity: ${product.productTitle}");
    }

    notifyListeners();
  }

  void removeProductFromCart(String productId) {
    _cartList.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    final index = _cartList.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      _cartList[index].quantity += 1;
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    final index = _cartList.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      if (_cartList[index].quantity > 1) {
        _cartList[index].quantity -= 1;
      } else {
        _cartList.removeAt(index);
      }
      notifyListeners();
    }
  }

  double getTotalAmount() {
    double total = 0.0;
    for (var item in _cartList) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void removeProduct(String productId) {
    _cartList.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void clearCart() {
    _cartList.clear();
    notifyListeners();
  }
}
