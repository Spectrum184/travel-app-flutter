import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/text_styles_constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.title, this.onTap, this.isCancelBtn = false});

  final String title;
  final Function()? onTap;
  final bool isCancelBtn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: isCancelBtn
              ? Gradients.secondGradientBackground
              : Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: isCancelBtn
              ? TextStyles.defaultStyle.bold.primaryTextColor
              : TextStyles.defaultStyle.bold.whiteTextColor,
        ),
      ),
    );
  }
}
