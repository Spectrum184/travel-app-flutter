import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/text_styles_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representations/screens/hotel_booking_screen.dart';
import 'package:travel_app/representations/widgets/app_bar_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> listImageLeft = [
    {
      'name': 'Korea',
      'image': AssetHelper.home1,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.home2,
    },
  ];
  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Turkey',
      'image': AssetHelper.home3,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.home4,
    },
  ];

  Widget _buildItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: kMediumPadding,
          ),
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding)),
          child: icon,
        ),
        const SizedBox(
          height: kItemPadding,
        ),
        Text(title)
      ]),
    );
  }

  Widget _buildItemDestination(String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HotelBookingScreen.routeName, arguments: name);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: kMediumPadding),
        child: Stack(alignment: Alignment.topRight, children: [
          ImageHelper.loadFromAsset(image,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              radius: const BorderRadius.all(Radius.circular(kDefaultPadding))),
          const Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Icon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            ),
          ),
          Positioned(
            left: kDefaultPadding,
            bottom: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.defaultStyle.whiteTextColor.bold,
                ),
                const SizedBox(
                  height: kItemPadding,
                ),
                Container(
                  padding: const EdgeInsets.all(kMinPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Color(0xffFFC107),
                      ),
                      SizedBox(
                        width: kMinPadding,
                      ),
                      Text('4.5')
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hi Everybody!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  Text(
                    "What on your mind?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                FontAwesomeIcons.bell,
                size: kDefaultIconSize,
                color: Colors.white,
              ),
              const SizedBox(
                width: kTopPadding,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kItemPadding),
                    color: Colors.white),
                padding: const EdgeInsets.all(kMinPadding),
                child: ImageHelper.loadFromAsset(AssetHelper.avatar),
              )
            ],
          )),
      implementLeading: true,
      child: Column(children: [
        const TextField(
          decoration: InputDecoration(
              hintText: "Search your result...",
              prefixIcon: Padding(
                  padding: EdgeInsets.all(kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: kDefaultIconSize,
                  )),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius:
                      BorderRadius.all(Radius.circular(kItemPadding))),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding)),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Row(
          children: [
            Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(AssetHelper.hotel,
                        width: kDefaultIconSize, height: kDefaultIconSize),
                    const Color(0xffFE9C5E), () {
              Navigator.of(context)
                  .pushNamed(HotelBookingScreen.routeName, arguments: "OK");
            }, 'Hotels')),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(AssetHelper.flight,
                        width: kDefaultIconSize, height: kDefaultIconSize),
                    const Color(0xffF77777),
                    () {},
                    'Flights')),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(AssetHelper.flightAll,
                        width: kDefaultIconSize, height: kDefaultIconSize),
                    const Color(0xff3EC8BC),
                    () {},
                    'All'))
          ],
        ),
        const SizedBox(
          height: kMinPadding,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: listImageLeft
                    .map((e) => _buildItemDestination(e["name"]!, e["image"]!))
                    .toList(),
              )),
              const SizedBox(
                width: kMinPadding,
              ),
              Expanded(
                  child: Column(
                children: listImageRight
                    .map((e) => _buildItemDestination(e["name"]!, e["image"]!))
                    .toList(),
              ))
            ],
          ),
        ))
      ]),
    );
  }
}
