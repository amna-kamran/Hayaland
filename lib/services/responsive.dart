import 'package:flutter/material.dart';
import 'package:web_task1/constants/app_break_points.dart';
import '../configs/app_media.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile() =>
      AppMedia.width < AppBreakpoints.xmd &&
      AppMedia.width >= AppBreakpoints.sm;

  static bool isDesktop() => AppMedia.width >= AppBreakpoints.lg;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppBreakpoints.lg) {
          return desktop;
        } else if (constraints.maxWidth >= AppBreakpoints.md) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
