import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representations/screens/intro_screen.dart';
import 'package:travel_app/representations/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue("ignoreIntroScreen") as bool?;

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    if (ignoreIntroScreen != null && ignoreIntroScreen) {
      Navigator.of(context).pushNamed(MainScreen.routeName);
    } else {
      Navigator.of(context).pushNamed(IntroScreen.routeName);
      LocalStorageHelper.setValue("ignoreIntroScreen", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.imageBackgroundSplash,
                fit: BoxFit.fitWidth)),
        Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.imageCircleSplash,
                fit: BoxFit.fitWidth)),
      ],
    );
  }
}
