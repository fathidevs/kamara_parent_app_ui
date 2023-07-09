import 'package:flutter/material.dart';

class MainCurrentPageIndexNotifier extends ChangeNotifier {
  int currentPageIndex = 0;
  void change(int newPageIndex) {
    currentPageIndex = newPageIndex;
    notifyListeners();
  }
}
