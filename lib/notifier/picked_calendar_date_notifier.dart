import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/calendar_data/calendar.dart';

class PickedCalendarDateNotifier extends ChangeNotifier {
  DateTime dateTime = Calendar.nowNt();

  void changeDate(DateTime newDateTime) {
    dateTime = newDateTime;
    notifyListeners();
  }
}
