import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representations/widgets/button_widget.dart';
import 'package:travel_app/representations/widgets/dash_line_widget.dart';
import 'package:travel_app/representations/widgets/item_utility_hotel_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget(
      {super.key,
      required this.roomImage,
      required this.roomName,
      required this.roomPrice,
      required this.roomUtility,
      required this.roomSize,
      required this.onTap,
      this.numberOfRoom});

  final String roomImage;
  final String roomName;
  final int roomPrice;
  final int roomSize;
  final String roomUtility;
  final Function() onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kItemPadding))),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: kMinPadding,
                ),
                Text("Room size: $roomSize"),
                const SizedBox(
                  height: kMinPadding,
                ),
                Text(roomUtility)
              ],
            ),
            ImageHelper.loadFromAsset(roomImage,
                radius: const BorderRadius.all(Radius.circular(kMinPadding)))
          ],
        ),
        ItemUtilityWidget(),
        const SizedBox(
          height: kMinPadding,
        ),
        const DashLineWidget(),
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$$roomPrice',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: kMinPadding,
                ),
                const Text("/night")
              ],
            )),
            numberOfRoom != null
                ? Text("${numberOfRoom}room")
                : Expanded(
                    child: ButtonWidget(
                    title: "Choose",
                    onTap: onTap,
                  ))
          ],
        )
      ]),
    );
  }
}
