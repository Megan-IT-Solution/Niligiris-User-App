import 'package:flutter/cupertino.dart';

class SwitchController extends ChangeNotifier {
  bool _isSwitchActive = false;
  bool get isSwitchActive => _isSwitchActive;

  makeSwitchActiveOrInActive(newValue) {
    _isSwitchActive = newValue;
    notifyListeners();
  }
}
