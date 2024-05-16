// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const HoverButton({
    super.key,
    required this.builder,
  });

  @override
  State<HoverButton> createState() => __HoverButtonState();
}

class __HoverButtonState extends State<HoverButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: widget.builder(isHovered),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
