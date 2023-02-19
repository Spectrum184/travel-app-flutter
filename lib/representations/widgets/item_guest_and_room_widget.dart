import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class ItemGuestAndRoomWidget extends StatefulWidget {
  const ItemGuestAndRoomWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.initData,
      required this.onChanged});
  final String title;
  final String icon;
  final int initData;
  final ValueChanged<int> onChanged;

  @override
  State<ItemGuestAndRoomWidget> createState() => _ItemGuestAndRoomWidgetState();
}

class _ItemGuestAndRoomWidgetState extends State<ItemGuestAndRoomWidget> {
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    number = widget.initData;

    super.initState();
    _textEditingController =
        TextEditingController(text: widget.initData.toString())
          ..addListener(() {
            if (_textEditingController.text != '') {
              number = int.parse(_textEditingController.text);
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kTopPadding),
          color: Colors.white),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kMediumPadding),
      child: Row(
        children: [
          ImageHelper.loadFromAsset(widget.icon),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Text(widget.title),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (number > 1) {
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                });
                widget.onChanged(number--);
              }
            },
            child: ImageHelper.loadFromAsset(AssetHelper.iconDecrease),
          ),
          Container(
            height: 35,
            width: 60,
            padding: const EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 18),
              ),
              onChanged: (value) {
                if (value != '') {
                  widget.onChanged(int.parse(value));
                }
              },
              onSubmitted: (String submitValue) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              });
              widget.onChanged(number++);
            },
            child: ImageHelper.loadFromAsset(AssetHelper.iconIncrease),
          )
        ],
      ),
    );
  }
}
