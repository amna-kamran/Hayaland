part of 'info_tile.dart';

class _ScreenState extends ChangeNotifier {
  bool _isHovered = false;

  bool get isHovered => _isHovered;

  void setIsHovered(bool value) {
    _isHovered = value;
    notifyListeners();
  }
}
