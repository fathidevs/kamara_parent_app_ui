import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/calendar_data/calendar.dart';

class PickedCalendarDate extends ChangeNotifier {
  DateTime dateTime = Calendar.nowNt();

  void changeDate(DateTime newDateTime) {
    dateTime = newDateTime;
    notifyListeners();
  }
}
