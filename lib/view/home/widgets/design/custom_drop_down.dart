import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:web_task1/constants/app_break_points.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> dropDownValues;
  final String dropdownValue;
  final ValueChanged<String?>? onChanged;
  final IconData icon;
  final TextStyle? itemTextStyle;
  final TextStyle? selectedItemTextStyle;
  final double iconSize;

  const CustomDropdown({
    super.key,
    required this.dropDownValues,
    required this.dropdownValue,
    required this.onChanged,
    this.icon = CupertinoIcons.chevron_down,
    this.itemTextStyle,
    this.selectedItemTextStyle,
    this.iconSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop() => MediaQuery.of(context).size.width >= AppBreakpoints.lg;
    bool isTablet() =>
        MediaQuery.of(context).size.width >= AppBreakpoints.md &&
        MediaQuery.of(context).size.width < AppBreakpoints.lg;
    return DropdownButton(
      padding: (!isTablet() && !isDesktop())
          ? EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.01,
              vertical: MediaQuery.sizeOf(context).width * 0.01,
            )
          : null,
      isExpanded: isDesktop() ? false : true,
      items: dropDownValues.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.grey,
              fontSize: (isDesktop() || isTablet())
                  ? 14.0
                  : MediaQuery.sizeOf(context).width * 0.025,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }).toList(),
      value: dropdownValue,
      icon: Icon(
        icon,
        size: iconSize,
      ),
      underline: const SizedBox(),
      elevation: 4,
      onChanged: (value) {},
    );
  }
}
