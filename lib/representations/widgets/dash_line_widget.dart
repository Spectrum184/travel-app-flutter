import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';

class DashLineWidget extends StatelessWidget {
  const DashLineWidget(
      {super.key, this.height = 1, this.color = ColorPalette.dividerColor});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      const dashWidth = 6.0;
      final dashHeight = height;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        ),
      );
    });
  }
}
