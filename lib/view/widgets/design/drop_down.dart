import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/drop_down_values.dart';

class CustomDropDown extends StatefulWidget {
  final double fontSize;
  final double iconSize;
  final double height;
  final double width;
  const CustomDropDown({
    super.key,
    required this.fontSize,
    required this.iconSize,
    required this.height,
    required this.width,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

String selectedValue = dropDownValues[0];

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          iconStyleData: IconStyleData(
            icon: Icon(
              CupertinoIcons.chevron_down,
              size: widget.iconSize,
              color: Colors.black,
            ),
          ),
          isDense: true,
          items: dropDownValues
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: const Color(darkgrey),
                      fontSize: widget.fontSize,
                    ),
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(
              () {
                selectedValue = value!;
              },
            );
          },
          buttonStyleData: ButtonStyleData(
            height: widget.height,
            width: widget.width,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(darkgrey),
              ),
              borderRadius: BorderRadius.circular(3.0),
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          menuItemStyleData: MenuItemStyleData(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
        ),
      ),
    );
  }
}
