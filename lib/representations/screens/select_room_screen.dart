import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/widgets/app_bar_container_widget.dart';
import 'package:travel_app/representations/widgets/item_room_booking_widget.dart';
import 'package:travel_app/representations/widgets/item_utility_hotel_widget.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({super.key});

  static const routeName = "/select_room";

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        implementLeading: true,
        titleString: "Select Room",
        child: SingleChildScrollView(
          child: Column(children: const [
            ItemRoomBookingWidget(
                roomImage: AssetHelper.room1,
                roomName: "Deluxe Room",
                roomPrice: "245",
                roomUtility: "Free Cancellation",
                roomSize: 27),
            SizedBox(
              height: kDefaultPadding,
            ),
            ItemRoomBookingWidget(
                roomImage: AssetHelper.room2,
                roomName: "Executive Suite",
                roomPrice: "289",
                roomUtility: "Non-refundable",
                roomSize: 32),
            SizedBox(
              height: kDefaultPadding,
            ),
            ItemRoomBookingWidget(
                roomImage: AssetHelper.room3,
                roomName: "King Bed Only Room",
                roomPrice: "214",
                roomUtility: "Non-refundable",
                roomSize: 24),
            SizedBox(
              height: kMediumPadding,
            ),
          ]),
        ));
  }
}
