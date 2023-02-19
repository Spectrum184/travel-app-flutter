import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/widgets/app_bar_container_widget.dart';
import 'package:travel_app/representations/widgets/button_widget.dart';
import 'package:travel_app/representations/widgets/item_guest_and_room_widget.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({super.key});

  static const String routeName = '/guest_and_room_booking';

  @override
  State<GuestAndRoomBookingScreen> createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  int guestNumber = 2;
  int roomNumber = 1;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        implementLeading: true,
        titleString: 'Guest and Room',
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 1.5,
            ),
            ItemGuestAndRoomWidget(
              title: "Guest",
              icon: AssetHelper.iconGuest,
              initData: guestNumber,
              onChanged: (value) => {guestNumber = value},
            ),
            ItemGuestAndRoomWidget(
                title: "Room",
                icon: AssetHelper.iconRoom,
                initData: roomNumber,
                onChanged: (value) => {roomNumber = value}),
            ButtonWidget(
              title: "Done",
              onTap: () {
                Navigator.of(context).pop([guestNumber, roomNumber]);
              },
            ),
          ],
        ));
  }
}
