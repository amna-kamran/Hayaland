part of '../product_screen.dart';

class _ScreenState extends ChangeNotifier {
  bool _isCartButtonHovered = false;
  bool _isShopButtonHovered = false;
  int _tableIndex = 0;
  bool _isTableTitleHovered0 = false;
  bool _isTableTitleHovered1 = false;

  bool get isCartButtonHovered => _isCartButtonHovered;
  bool get isShopButtonHovered => _isShopButtonHovered;
  int get tableIndex => _tableIndex;
  bool get isTableTitleHovered0 => _isTableTitleHovered0;
  bool get isTableTitleHovered1 => _isTableTitleHovered1;

  void setIsHovered(bool value) {
    _isCartButtonHovered = value;
    notifyListeners();
  }

  void setIsShopButtonHovered(bool value) {
    _isShopButtonHovered = value;
    notifyListeners();
  }

  void setTableIndex(int index) {
    _tableIndex = index;
    notifyListeners();
  }

  void setIsTableTitleHovered0(bool value) {
    _isTableTitleHovered0 = value;
    notifyListeners();
  }

  void setIsTableTitleHovered1(bool value) {
    _isTableTitleHovered1 = value;
    notifyListeners();
  }
}
