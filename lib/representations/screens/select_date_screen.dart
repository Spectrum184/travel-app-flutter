import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/representations/widgets/app_bar_container_widget.dart';
import 'package:travel_app/representations/widgets/button_widget.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});
  static const String routeName = '/select_date';

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        titleString: 'Select Date',
        implementLeading: true,
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalette.yellowColor,
              startRangeSelectionColor: ColorPalette.yellowColor,
              endRangeSelectionColor: ColorPalette.yellowColor,
              rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
              todayHighlightColor: ColorPalette.yellowColor,
              toggleDaySelection: true,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                } else {
                  rangeEndDate = null;
                  rangeStartDate = null;
                }
              },
            ),
            ButtonWidget(
              title: "Select Date",
              onTap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              },
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ButtonWidget(
              title: "Cancel",
              isCancelBtn: true,
              onTap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              },
            ),
          ],
        ));
  }
}
