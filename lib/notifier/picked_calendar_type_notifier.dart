import 'package:flutter/material.dart';

class PickedCalendarTypeNotifier extends ChangeNotifier {
  bool isGregorian = true;

  void changeType() {
    isGregorian = !isGregorian;
    notifyListeners();
  }
}
