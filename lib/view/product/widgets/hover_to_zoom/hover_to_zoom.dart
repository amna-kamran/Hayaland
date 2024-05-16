import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_task1/constants/image_paths.dart';
part '_body.dart';
part '_state.dart';

class HoverToZoom extends StatelessWidget {
  final String imagePath;
  final double dimension;

  const HoverToZoom({
    super.key,
    required this.imagePath,
    required this.dimension,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: _Body(
        imagePath: imagePath,
        dimension: dimension,
      ),
    );
  }
}
