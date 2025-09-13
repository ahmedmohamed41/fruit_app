import 'package:e_commerce_app/core/routes_manager/routes_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.splash,
    );
  }
}
