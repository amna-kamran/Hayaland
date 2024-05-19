import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_task1/constants/app_break_points.dart';
part '_body.dart';
part '_state.dart';

class HoverToZoom extends StatelessWidget {
  final String imagePath;
  final double dimension;
  final String pcl;

  const HoverToZoom({
    super.key,
    required this.imagePath,
    required this.dimension,
    required this.pcl,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: _Body(
        imagePath: imagePath,
        dimension: dimension,
        pcl: pcl,
      ),
    );
  }
}
