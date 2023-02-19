import 'package:flutter/material.dart';
import 'package:travel_app/representations/screens/intro_screen.dart';
import 'package:travel_app/representations/screens/main_screen.dart';
import 'package:travel_app/representations/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
};
