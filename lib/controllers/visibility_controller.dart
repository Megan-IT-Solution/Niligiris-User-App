import 'package:flutter/cupertino.dart';

class VisibilityController extends ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  setVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
