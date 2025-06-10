import 'package:flutter/cupertino.dart';
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

List<String> categoriesList = [
  "Atta & Flours",
  "Cold Pressed/Wood Oil & Gee",
  "Fresh Vegetables & Greens",
  "Snacks Corners",
  "Spices Whole",
  "Indian Dals/Pulses/Lentils",
  "Masala",
  "UnPolished Millets & Ancients Rice Variety",
  "Pooja Items",
  "Variety of Rices",
  "Ready Mix & Pickles",
  "Sugar, Salts, Nuts & Dry Fruits",
  "Sun Dried (Vatal/Apalam)",
  "Tea & Coffee Powder",
  "Vermicelli & Noodles",
];
List<Widget> screens = [HomeScreen(), WishlistScreen(), ProfileScreen()];
