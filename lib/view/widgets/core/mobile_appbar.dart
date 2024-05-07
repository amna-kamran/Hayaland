import 'package:flutter/material.dart';
import 'package:web_task1/constants/image_paths.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.sizeOf(context).width;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [-0.5, 1],
            colors: [
              Colors.white.withOpacity(0.8),
              Colors.white.withOpacity(0.0),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.menu),
            Image.asset(
              ImagePaths.logo,
              width: md * 0.2,
              height: md * 0.2,
            ),
            const Icon(Icons.shopping_cart),
          ],
        ),
      ),
    );
  }
}
