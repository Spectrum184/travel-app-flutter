import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class ItemUtilityWidget extends StatelessWidget {
  ItemUtilityWidget({super.key});

  final List<Map<String, String>> listUtility = [
    {"icon": AssetHelper.iconWifi, "name": "Free\nWifi"},
    {"icon": AssetHelper.iconNoRefund, "name": "Non-\nRefundable"},
    {"icon": AssetHelper.iconBreakfast, "name": "Free\nBreakfast"},
    {"icon": AssetHelper.iconNoSmoking, "name": "Non-\nSmoking"},
  ];

  Widget _buildItemUtilityHotel(String icon, String title) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        const SizedBox(
          height: kTopPadding,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtility
            .map((e) => _buildItemUtilityHotel(e["icon"]!, e["name"]!))
            .toList(),
      ),
    );
  }
}
