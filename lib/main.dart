import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representations/screens/routes.dart';
import 'package:travel_app/representations/screens/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.intiLocalStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel app',
      theme: ThemeData(
          primaryColor: ColorPalette.primaryColor,
          scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
          colorScheme: ColorScheme.fromSeed(
              background: ColorPalette.backgroundScaffoldColor,
              seedColor: ColorPalette.backgroundScaffoldColor)),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
