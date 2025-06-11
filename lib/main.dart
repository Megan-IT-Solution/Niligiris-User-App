import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilgiris/controllers/cart_controller.dart';
import 'package:nilgiris/controllers/switch_controller.dart';
import 'package:nilgiris/controllers/visibility_controller.dart';
import 'package:nilgiris/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VisibilityController()),
        ChangeNotifierProvider(create: (_) => SwitchController()),
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nilgiris User App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
