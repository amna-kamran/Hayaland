import 'package:flutter/material.dart';
import 'package:web_task1/constants/app_break_points.dart';

class VisibilityIcon extends StatelessWidget {
  const VisibilityIcon({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop() => MediaQuery.of(context).size.width >= AppBreakpoints.lg;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.005),
      child: Icon(
        opticalSize: 30,
        Icons.visibility,
        size: isDesktop() ? 25.0 : 15,
        color: const Color(0xFF292929),
      ),
    );
  }
}
