part of 'hover_to_zoom.dart';

class _ScreenState extends ChangeNotifier {
  bool _showPreview = false;
  double _hoverX = 0.0;
  double _hoverY = 0.0;
  double _zoomHoverX = 0.0;
  double _zoomHoverY = 0.0;

  bool get showPreview => _showPreview;
  double get hoverX => _hoverX;
  double get hoverY => _hoverY;
  double get zoomHoverX => _zoomHoverX;
  double get zoomHoverY => _zoomHoverY;

  void setShowPreview(value) {
    _showPreview = value;
    notifyListeners();
  }

  void setCoordinates(x, y, zx, zy) {
    _hoverX = x;
    _hoverY = y;
    _zoomHoverX = zx;
    _zoomHoverY = zy;
    notifyListeners();
  }
}
