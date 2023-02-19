import 'package:flutter/material.dart';
import 'package:travel_app/core/data/models/hotel_model.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representations/widgets/app_bar_container_widget.dart';
import 'package:travel_app/representations/widgets/item_hotel_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  static const String routeName = '/hotel_screen';

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final List<HotelModel> listHotel = [
    HotelModel(
        hotelImage: AssetHelper.hotel1,
        awayKilometer: "2.3 km",
        hotelName: "Grand Luxury’s",
        location: "Banyumas, Jateng",
        numberOfView: 2456,
        price: 234,
        star: 4.2),
    HotelModel(
        hotelImage: AssetHelper.hotel2,
        awayKilometer: "364 m",
        hotelName: "Royal Palm Heritage",
        location: "Purwokerto, Jateng",
        numberOfView: 3241,
        price: 143,
        star: 4.5),
    HotelModel(
        hotelImage: AssetHelper.hotel3,
        awayKilometer: "2.3 km",
        hotelName: "The Orlando House",
        location: "Banyumas, Jateng",
        numberOfView: 1234,
        price: 132,
        star: 3.8)
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        implementLeading: true,
        implementTrailing: true,
        titleString: "Select Room",
        child: SingleChildScrollView(
          child: Column(
            children:
                listHotel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
          ),
        ));
  }
}
