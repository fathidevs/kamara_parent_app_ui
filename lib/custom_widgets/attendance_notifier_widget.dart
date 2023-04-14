import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/calendar_data/calendar.dart';

class AttendanceNotifierWidget extends StatelessWidget {
  final String status;
  final DateTime dateTime;
  final double margin;

  const AttendanceNotifierWidget({
    Key? key,
    required this.status,
    required this.dateTime,
    this.margin = 12.0,
  }) : super(key: key);
  Color _color() {
    bool notify = Calendar.isPast(dateTime);
    if (notify) {
      if (status == "present") {
        return Colors.green;
      }
      if (status == "absent") {
        return Colors.red;
      }
      if (status == "late") {
        return Colors.orange;
      }
      if (status == "leave") {
        return Colors.yellow;
      }
    }

    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) => Container(
        height: 3.5,
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
            color: _color(), borderRadius: BorderRadius.circular(100.0)),
      );
}
