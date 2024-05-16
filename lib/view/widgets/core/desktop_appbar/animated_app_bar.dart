import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_task1/bloc/appbar/appbar_bloc.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/menu.dart';
import '_hover_button.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarBloc, AppBarState>(
      builder: (context, state) {
        if (state is ScrollPositionState) {
          return state.isAboveThreshold
              ? Container(
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
                                horizontal:
                                    MediaQuery.sizeOf(context).width * 0.01,
                              ),
                              child: Center(
                                child: HoverButton(
                                  builder: (isHovered) => Text(
                                    entry.value,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.013,
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
                            horizontal:
                                MediaQuery.sizeOf(context).width * 0.01),
                        child: HoverButton(
                          builder: (isHovered) => Icon(
                            Icons.shopping_cart,
                            color: isHovered
                                ? Colors.white
                                : const Color(darkgrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container();
        }
        return Container();
      },
    );
  }

  @override
  Size get preferredSize {
    const double height = 50;
    return const Size.fromHeight(height);
  }
}
