import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/drop_down_values.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

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
          iconStyleData: const IconStyleData(
            icon: Icon(
              CupertinoIcons.chevron_down,
              size: 18,
            ),
          ),
          isDense: true,
          items: dropDownValues
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Color(darkgrey),
                      fontSize: 14,
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
            padding: const EdgeInsets.only(right: 8),
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color(darkgrey),
              ),
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
