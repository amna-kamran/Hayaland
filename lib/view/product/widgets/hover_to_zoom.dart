import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverToZoom extends StatefulWidget {
  final String imagePath;
  final double dimension;
  static const double previewSize = 150.0;
  static const double zoomScale = 3.0;
  static const Duration zoomDuration = Duration(milliseconds: 200);
  static final BorderRadius borderRadius = BorderRadius.circular(8);

  const HoverToZoom({
    super.key,
    required this.imagePath,
    this.dimension = 400.0,
  });

  @override
  State<HoverToZoom> createState() => _HoverToZoomState();
}

class _HoverToZoomState extends State<HoverToZoom>
    with SingleTickerProviderStateMixin {
  double hoverX = 0.0;
  double hoverY = 0.0;
  double zoomHoverX = 0.0;
  double zoomHoverY = 0.0;
  bool showPreview = false;

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: HoverToZoom.zoomDuration,
    );
  }

  @override
  void dispose() {
    /// Dispose of the animation controller.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: handleHover,
      onEnter: (_) => togglePreview(true),
      onExit: (_) => togglePreview(false),
      child: SizedBox.square(
        dimension: widget.dimension,
        child: showPreview
            ? buildZoomedImage()
            : ClipRRect(
                borderRadius: HoverToZoom.borderRadius,
                child: Image.asset(
                  widget.imagePath,
                )),
      ),
    );
  }

  Widget buildZoomedImage() => LayoutBuilder(
        builder: (context, constraints) {
          // Get the available width
          final availableWidth = constraints.maxWidth;

          // Calculate the offset for the zoomed image
          final offsetX = min(-zoomHoverX * widget.dimension,
              availableWidth - widget.dimension);

          // Build the zoomed image
          return ClipRRect(
            borderRadius: HoverToZoom.borderRadius,
            child: Transform.translate(
              offset: Offset(
                offsetX,
                -zoomHoverY * widget.dimension,
              ),
              child: Transform.scale(
                scale: HoverToZoom.zoomScale,
                child: Image.asset(widget.imagePath),
              ),
            ),
          );
        },
      );

  void handleHover(PointerHoverEvent event) {
    setState(() {
      // Update the hover coordinates
      hoverX = (event.localPosition.dx - HoverToZoom.previewSize / 2)
          .clamp(0, widget.dimension - HoverToZoom.previewSize);
      hoverY = (event.localPosition.dy - HoverToZoom.previewSize / 2)
          .clamp(0, widget.dimension - HoverToZoom.previewSize);

      // Update the zoom hover coordinates
      zoomHoverX = (event.localPosition.dx / widget.dimension * 2) - 1;
      zoomHoverY = (event.localPosition.dy / widget.dimension * 2) - 1;
    });
  }

  void togglePreview(bool value) {
    setState(() => showPreview = value);
  }
}
