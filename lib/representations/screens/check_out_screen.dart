import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/data/models/room_model.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representations/screens/main_screen.dart';
import 'package:travel_app/representations/widgets/app_bar_container_widget.dart';
import 'package:travel_app/representations/widgets/button_widget.dart';
import 'package:travel_app/representations/widgets/item_room_booking_widget.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, required this.roomModel});

  static const routeName = "/checkout_screen";
  final RoomModel roomModel;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<String> listStep = ["Book and Review", "Payment", "Confirm"];

  Widget _buildItemOptionCheckout(
      String icon, String title, String value, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            ImageHelper.loadFromAsset(icon),
            const SizedBox(
              width: kItemPadding,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.all(kMinPadding),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: kMinPadding,
              ),
              Text(
                value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.primaryColor.withOpacity(0.85)),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget _buildItemCheckout(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
              borderRadius:
                  const BorderRadius.all(Radius.circular(kMediumPadding))),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(color: isCheck ? Colors.black : Colors.white),
          ),
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        Text(
          stepName,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          const SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        const SizedBox(
          width: kMinPadding,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        implementLeading: true,
        titleString: "Checkout",
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: listStep
                  .map((e) => _buildItemCheckout(
                      listStep.indexOf(e) + 1,
                      e,
                      listStep.indexOf(e) == listStep.length - 1,
                      listStep.indexOf(e) == 0))
                  .toList(),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ItemRoomBookingWidget(
              roomImage: widget.roomModel.roomImage,
              roomName: widget.roomModel.roomName,
              roomPrice: widget.roomModel.price,
              roomUtility: widget.roomModel.utility,
              roomSize: widget.roomModel.size,
              onTap: () {},
              numberOfRoom: 1,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            _buildItemOptionCheckout(AssetHelper.iconContact, "Contact detail",
                "Add contact", context),
            const SizedBox(
              height: kDefaultPadding,
            ),
            _buildItemOptionCheckout(
                AssetHelper.iconPromo, "Promo Code", "Add promo code", context),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: "Payment",
              onTap: () {
                Navigator.of(context).popUntil(
                    (route) => route.settings.name == MainScreen.routeName);
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
          ]),
        ));
  }
}
