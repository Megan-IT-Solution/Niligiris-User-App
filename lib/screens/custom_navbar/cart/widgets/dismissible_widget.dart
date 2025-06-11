import 'package:flutter/material.dart';
import 'package:nilgiris/models/product_model.dart';

import '../../../../constants/app_colors.dart';

class DismissibleWidget extends StatelessWidget {
  final ProductModel product;
  final Widget child;

  /// This should match the correct type
  final Future<bool?> Function(DismissDirection) onConfirmDismiss;

  const DismissibleWidget({
    super.key,
    required this.product,
    required this.child,
    required this.onConfirmDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.productId.toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: onConfirmDismiss,
      background: Container(
        width: 100,
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.delete_outline,
          size: 30,
          color: AppColors.primaryWhite,
        ),
      ),
      child: child,
    );
  }
}
