import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/extensions/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representations/screens/hotel_screen.dart';
import 'package:travel_app/representations/screens/select_date_screen.dart';
import 'package:travel_app/representations/widgets/app_bar_container_widget.dart';
import 'package:travel_app/representations/widgets/button_widget.dart';
import 'package:travel_app/representations/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, required this.destination});

  static const routeName = '/hotel_booking_screen';
  final String destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  String? roomSelected;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: "Hotel",
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          ItemBookingWidget(
            icon: AssetHelper.iconLocation,
            description: widget.destination,
            title: "Destination",
            onTap: () {},
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          StatefulBuilder(builder: (context, setState) {
            return ItemBookingWidget(
              icon: AssetHelper.iconCalendar,
              description: dateSelected ?? "13 Feb - 18 Feb 2021",
              title: "Select Date",
              onTap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(SelectDateScreen.routeName);
                if (result != null) {
                  if (!(result as List<DateTime?>)
                      .any((element) => element == null)) {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  }
                  setState(() {});
                }
              },
            );
          }),
          const SizedBox(
            height: kMediumPadding,
          ),
          StatefulBuilder(builder: (context, setState) {
            return ItemBookingWidget(
              icon: AssetHelper.iconBed,
              description: roomSelected ?? "2 Guest, 1 Room",
              title: "Guest and Room",
              onTap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(GuestAndRoomBookingScreen.routeName);

                if (result != null) {
                  if (!(result as List<int?>)
                      .any((element) => element == null)) {
                    roomSelected = '${result[0]} Guest - ${result[1]} Room';
                  }
                } else {
                  roomSelected = null;
                }
                setState(() {});
              },
            );
          }),
          const SizedBox(
            height: kMediumPadding,
          ),
          ButtonWidget(
            title: "Search",
            onTap: () {
              Navigator.of(context).pushNamed(HotelScreen.routeName);
            },
          )
        ]),
      ),
    );
  }
}
