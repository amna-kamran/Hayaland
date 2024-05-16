import 'package:flutter/material.dart';

class ExpandedAppBar extends StatelessWidget {
  const ExpandedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
      ),
      child: Image.asset(
        "lib/assets/images/hayaland.png",
        width: 250,
      ),
    );
  }
}
