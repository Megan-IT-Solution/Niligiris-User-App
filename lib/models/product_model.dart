class ProductModel {
  String productId;
  String productTitle;
  String productImage;
  String description;
  double price;
  int quantity;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productImage,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}
