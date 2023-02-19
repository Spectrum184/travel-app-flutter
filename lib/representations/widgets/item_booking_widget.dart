import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {super.key,
      required this.icon,
      required this.description,
      required this.title,
      this.onTap});

  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(kItemPadding))),
        child: Row(children: [
          Image.asset(
            icon,
            width: 36,
            height: 36,
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
              ),
              const SizedBox(
                height: kItemPadding,
              ),
              Text(
                description,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ]),
      ),
    );
  }
}
