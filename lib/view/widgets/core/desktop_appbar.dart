import 'package:flutter/material.dart';

import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/menu.dart';
import 'package:web_task1/view/home/screens/widgets/_hover_button.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      expandedHeight: MediaQuery.sizeOf(context).width * 0.115,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        expandedTitleScale: 1,
        background: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).width * 0.075,
              color: Colors.white,
              child: Image.asset(
                'lib/assets/images/hayaland.png',
                width: MediaQuery.sizeOf(context).width * 0.13,
                height: MediaQuery.sizeOf(context).width * 0.13,
              ),
            ),
          ],
        ),
        titlePadding: EdgeInsets.zero,
        title: Container(
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
                              fontSize:
                                  MediaQuery.sizeOf(context).width * 0.013,
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
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
