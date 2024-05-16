part of 'hover_to_zoom.dart';

class _Body extends StatefulWidget {
  final String imagePath;
  final double dimension;
  static const double previewSize = 150.0;
  static const double zoomScale = 3.0;
  static const Duration zoomDuration = Duration(milliseconds: 200);
  static final BorderRadius borderRadius = BorderRadius.circular(8);

  const _Body({
    required this.imagePath,
    this.dimension = 400.0,
  });

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: _Body.zoomDuration,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hoverProvider = Provider.of<_ScreenState>(context);
    return MouseRegion(
      onHover: (event) {
        hoverProvider.setCoordinates(
          event.localPosition.dx - _Body.previewSize / 2,
          event.localPosition.dy - _Body.previewSize / 2,
          (event.localPosition.dx / widget.dimension * 2) - 1,
          (event.localPosition.dy / widget.dimension * 2) - 1,
        );
      },
      onEnter: (_) => hoverProvider.setShowPreview(true),
      onExit: (_) => hoverProvider.setShowPreview(false),
      child: Stack(
        children: [
          SizedBox.square(
            dimension: widget.dimension,
            child: hoverProvider.showPreview
                ? buildZoomedImage(
                    hoverProvider.zoomHoverX, hoverProvider.zoomHoverY)
                : ClipRRect(
                    borderRadius: _Body.borderRadius,
                    child: Image.asset(
                      widget.imagePath,
                    )),
          ),
          Image.asset(
            ImagePaths.logo,
          ),
        ],
      ),
    );
  }

  Widget buildZoomedImage(double zoomHoverX, double zoomHoverY) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;

        final offsetX = min(
            -zoomHoverX * widget.dimension, availableWidth - widget.dimension);

        return ClipRRect(
          borderRadius: _Body.borderRadius,
          child: Transform.translate(
            offset: Offset(
              offsetX,
              -zoomHoverY * widget.dimension,
            ),
            child: Transform.scale(
              scale: _Body.zoomScale,
              child: Image.asset(widget.imagePath),
            ),
          ),
        );
      },
    );
  }
}
