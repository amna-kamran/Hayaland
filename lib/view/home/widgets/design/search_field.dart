import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_task1/constants/colors.dart';

class SearchField extends StatelessWidget {
  final double fontSize;
  final double iconSize;
  const SearchField({
    super.key,
    required this.onChanged,
    required this.fontSize,
    required this.iconSize,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        height: 1,
        color: Colors.black,
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(color: Color(lightgrey)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(color: Color(lightgrey)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(color: Color(lightgrey)),
        ),
        labelText: 'Enter keyword',
        labelStyle: TextStyle(
          color: Colors.black87,
          fontSize: fontSize,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: Colors.black,
          size: iconSize,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
