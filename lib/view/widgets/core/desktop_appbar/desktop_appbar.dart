import 'package:flutter/material.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/image_paths.dart';
import 'package:web_task1/constants/menu.dart';

import '_hover_button.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.sizeOf(context).width;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      expandedHeight: md * 0.115,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        expandedTitleScale: 1,
        background: Column(
          children: [
            Container(
              width: double.infinity,
              height: md * 0.075,
              color: Colors.white,
              child: Image.asset(
                ImagePaths.logo,
                width: md * 0.13,
                height: md * 0.13,
              ),
            ),
          ],
        ),
        titlePadding: EdgeInsets.zero,
        title: Container(
          height: md * 0.04,
          padding: EdgeInsets.symmetric(horizontal: md * 0.15),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              ...menu.asMap().entries.map(
                    (entry) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: md * 0.01,
                      ),
                      child: Center(
                        child: HoverButton(
                          builder: (isHovered) => Text(
                            entry.value,
                            style: TextStyle(
                              fontSize: md * 0.013,
                              color: isHovered
                                  ? Colors.white
                                  : const Color(darkgrey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: md * 0.01),
                child: HoverButton(
                  builder: (isHovered) => Icon(
                    Icons.shopping_cart,
                    color: isHovered ? Colors.white : const Color(darkgrey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
