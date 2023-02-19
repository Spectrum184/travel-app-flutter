import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/text_styles_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representations/screens/main_screen.dart';
import 'package:travel_app/representations/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static const String routeName = 'intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignmentGeometry) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: alignmentGeometry,
            child: ImageHelper.loadFromAsset(image,
                height: 400, fit: BoxFit.fitHeight),
          ),
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kMediumPadding,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ]),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            _buildItemIntroScreen(
                AssetHelper.intro1,
                'Book a flight',
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.centerRight),
            _buildItemIntroScreen(
                AssetHelper.intro2,
                'Find a hotel room',
                'Select the day, book your room. We give you the best price.',
                Alignment.center),
            _buildItemIntroScreen(
                AssetHelper.intro3,
                'Enjoy your trip',
                'Easy discovering new places and share these between your friends and travel together.',
                Alignment.centerLeft),
          ],
        ),
        Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              children: [
                Expanded(
                    flex: 6,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          dotWidth: kMinPadding,
                          dotHeight: kMinPadding,
                          activeDotColor: Colors.yellow),
                    )),
                StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                          flex: 4,
                          child: ButtonWidget(
                            title: snapshot.data != 2 ? "Next" : "Get started",
                            onTap: () {
                              if (_pageController.page != 2) {
                                _pageController.nextPage(
                                    duration: const Duration(microseconds: 200),
                                    curve: Curves.easeIn);
                              } else {
                                Navigator.of(context)
                                    .pushNamed(MainScreen.routeName);
                              }
                            },
                          ));
                    })
              ],
            ))
      ],
    ));
  }
}
