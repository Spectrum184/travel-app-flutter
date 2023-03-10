import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/representations/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          Container(color: Colors.amber),
          Container(color: Colors.blue),
          Container(color: Colors.red),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(
              horizontal: kMediumPadding, vertical: kDefaultPadding),
          items: [
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  size: kDefaultIconSize,
                ),
                title: const Text("Home")),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.solidHeart,
                  size: kDefaultIconSize,
                ),
                title: const Text("Likes")),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.briefcase,
                  size: kDefaultIconSize,
                ),
                title: const Text("Booking")),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.solidUser,
                  size: kDefaultIconSize,
                ),
                title: const Text("Profile")),
          ]),
    );
  }
}
