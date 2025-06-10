import 'package:flutter/cupertino.dart';
import 'package:nilgiris/models/category_model.dart';
import 'package:nilgiris/models/product_model.dart';
import 'package:nilgiris/screens/custom_navbar/home/home_screen.dart';
import 'package:nilgiris/screens/custom_navbar/profile/profile_screen.dart';
import 'package:nilgiris/screens/custom_navbar/wishlist/wishlist_screen.dart';

final List<Map<String, String>> pages = [
  {
    'title': 'Get Discounts\nOn All Products',
    'slogan': 'Discover amazing deals on everything you love.',
    'image': "assets/icons/apple.png",
  },
  {
    'title': 'Buy Quality\nDairy Products',
    'slogan': 'A quality dairy products are now at your DoorStep',
    'image': "assets/images/dairy.png",
  },
  {
    'title': 'Buy Grocery',
    'slogan': 'Only the Freshest Ingredients, Delivered Straight to You',
    'image': "assets/images/grocery.png",
  },
  {
    'title': 'Fast Delivery',
    'slogan': 'Your Order, At Lightning Speed!',
    'image': "assets/images/rider.png",
  },
  {
    'title': 'Enjoy Quality Food',
    'slogan': 'Quality Food That Turns Every Meal Into a Celebration',
    'image': "assets/images/last.png",
  },
];

List<CategoryModel> categories = [
  CategoryModel(id: "1", title: "Atta & Flours", icon: "assets/icons/1.png"),
  CategoryModel(
    id: "2",
    title: "Cold Pressed/\nWood Oil & Ghee",
    icon: "assets/icons/2.png",
  ),
  CategoryModel(
    id: "3",
    title: "Fresh Vegetables\n& Greens",
    icon: "assets/icons/3.png",
  ),
  CategoryModel(id: "4", title: "Snacks Corners", icon: "assets/icons/4.png"),
  CategoryModel(id: "5", title: "Spices Whole", icon: "assets/icons/5.png"),
  CategoryModel(
    id: "6",
    title: "Indian Dals/\nPulses/Lentils",
    icon: "assets/icons/6.png",
  ),
  CategoryModel(id: "7", title: "Masala", icon: "assets/icons/7.png"),
  CategoryModel(
    id: "8",
    title: "UnPolished Millets\n& Ancient Rice Variety",
    icon: "assets/icons/8.png",
  ),
  CategoryModel(id: "9", title: "Pooja Items", icon: "assets/icons/9.png"),
  CategoryModel(
    id: "10",
    title: "Variety of Rices",
    icon: "assets/icons/10.png",
  ),
  CategoryModel(
    id: "11",
    title: "Ready Mix & Pickles",
    icon: "assets/icons/11.png",
  ),
  CategoryModel(
    id: "12",
    title: "Sugar, Salts,\nNuts & Dry Fruits",
    icon: "assets/icons/12.png",
  ),
  CategoryModel(
    id: "13",
    title: "Sun Dried\n(Vatal/Apalam)",
    icon: "assets/icons/13.png",
  ),
  CategoryModel(
    id: "14",
    title: "Tea & Coffee\nPowder",
    icon: "assets/icons/14.png",
  ),
  CategoryModel(
    id: "15",
    title: "Vermicelli & Noodles",
    icon: "assets/icons/15.png",
  ),
];

List<Widget> screens = [HomeScreen(), WishlistScreen(), ProfileScreen()];
List<Color> categoryColors = [
  Color(0xFFE6F2EA),
  Color(0xFFFFE9E5),
  Color(0xFFFFF6E3),
  Color(0xFFF3EFFA),
  Color(0xFFDCF4F5),
  Color(0xFFFFE8F2),
  Color(0xFFE6F2EA),
  Color(0xFFFFE9E5),
  Color(0xFFFFF6E3),
  Color(0xFFF3EFFA),
  Color(0xFFDCF4F5),
  Color(0xFFFFE8F2),
  Color(0xFFE6F2EA),
  Color(0xFFFFE9E5),
  Color(0xFFFFF6E3),
];

List<Color> productCategoriesColor = [
  Color(0xFFFFCEC1),
  Color(0xFFFCFFD9),
  Color(0xFFFFE6C2),
  Color(0xFFFEE1ED),
];
List<ProductModel> productList = [
  ProductModel(
    productId: "1",
    productTitle: "Fresh Peach",
    productImage: "assets/images/peach.png",
    price: 8.5,
  ),
  ProductModel(
    productId: "2",
    productTitle: "Avocado",
    productImage: "assets/images/avacodo.png",
    price: 11.5,
  ),
  ProductModel(
    productId: "3",
    productTitle: "Pineapple",
    productImage: "assets/images/pineapple.png",
    price: 4.5,
  ),
  ProductModel(
    productId: "4",
    productTitle: "Black Grapes",
    productImage: "assets/images/graph.png",
    price: 9.0,
  ),
];
