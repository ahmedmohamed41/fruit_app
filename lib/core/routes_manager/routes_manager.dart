import 'package:e_commerce_app/features/auth/login/presentation/views/login_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

abstract class RoutesManager {
  RoutesManager._();
  static const String splash = '/splashView';
  static const String onBoarding = '/onBoardingView';
  static const String login = '/login';
  static Map<String, WidgetBuilder> routes = {
    splash : (context) => SplashView(),
    onBoarding : (context) => OnBoardingView(),
    login : (context) => LoginView(),
  };
}
