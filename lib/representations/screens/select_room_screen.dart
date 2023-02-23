import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/data/models/room_model.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/screens/check_out_screen.dart';
import 'package:travel_app/representations/widgets/app_bar_container_widget.dart';
import 'package:travel_app/representations/widgets/item_room_booking_widget.dart';

class SelectRoomScreen extends StatelessWidget {
  SelectRoomScreen({super.key});

  static const routeName = "/select_room";

  final List<RoomModel> listRoom = [
    RoomModel(
        roomImage: AssetHelper.room1,
        roomName: "Deluxe Room",
        utility: "Free Cancellation",
        size: 27,
        price: 245),
    RoomModel(
        roomImage: AssetHelper.room2,
        roomName: "Executive Suite",
        utility: "Non-refundable",
        size: 289,
        price: 32),
    RoomModel(
        roomImage: AssetHelper.room1,
        roomName: "King Bed Only Room",
        utility: "Non-refundable",
        size: 214,
        price: 24),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        implementLeading: true,
        titleString: "Select Room",
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: kDefaultPadding,
            ),
            ...listRoom
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: kDefaultPadding),
                      child: ItemRoomBookingWidget(
                        roomImage: e.roomImage,
                        roomName: e.roomName,
                        roomPrice: e.price,
                        roomUtility: e.utility,
                        roomSize: e.size,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              CheckOutScreen.routeName,
                              arguments: e);
                        },
                      ),
                    ))
                .toList(),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
          ]),
        ));
  }
}
