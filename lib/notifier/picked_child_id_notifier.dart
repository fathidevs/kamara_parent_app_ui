import 'package:flutter/material.dart';

class PickedChildIdNotifier extends ChangeNotifier {
  int id = 0;

  void changeId(int newId) {
    id = newId;
    notifyListeners();
  }
}
