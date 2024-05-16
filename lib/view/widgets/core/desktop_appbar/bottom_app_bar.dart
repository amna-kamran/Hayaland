import 'package:flutter/material.dart';

import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/menu.dart';

import '_hover_button.dart';

class BottomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const BottomAppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.sizeOf(context).width * 0.04,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.15),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: [
          ...menu.asMap().entries.map(
                (entry) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.01,
                  ),
                  child: Center(
                    child: HoverButton(
                      builder: (isHovered) => Text(
                        entry.value,
                        style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width * 0.013,
                          color:
                              isHovered ? Colors.white : const Color(darkgrey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.01),
            child: HoverButton(
              builder: (isHovered) => Icon(
                Icons.shopping_cart,
                color: isHovered ? Colors.white : const Color(darkgrey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    const double height = 50;
    return const Size.fromHeight(height);
  }
}
