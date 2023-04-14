import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kamara_parent_app_ui/calendar_data/calendar.dart';

import '../colors.dart';

class CalendarNavigator extends StatefulWidget {
  final Function onMonthChanged;
  const CalendarNavigator({
    Key? key,
    required this.onMonthChanged(DateTime dateTime),
  }) : super(key: key);

  @override
  State<CalendarNavigator> createState() => _CalendarNavigatorState();
}

class _CalendarNavigatorState extends State<CalendarNavigator> {
  DateTime dateTime = DateTime.now();
  int currentMonth = Calendar.now.month;

  @override
  Widget build(BuildContext context) {
    int daysInMonth = Jiffy(dateTime).daysInMonth;
    DateTime firstDateInMonth = DateTime(dateTime.year, dateTime.month, 1);
    DateTime lastDateInMonth =
        DateTime(dateTime.year, dateTime.month, daysInMonth);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            dateTime = lastDateInMonth.subtract(Duration(days: daysInMonth));
            widget.onMonthChanged(dateTime);
          },
          icon: const Icon(
            Icons.arrow_left_rounded,
            size: 38.0,
            color: MyColors.colorPrimary,
          ),
        ),
        Column(
          children: [
            Text(
              dateTime.year.toString(),
              style: const TextStyle(
                  color: MyColors.colorPrimary,
                  fontWeight: FontWeight.w900,
                  fontSize: 26.0),
            ),
            Text(
              Jiffy(dateTime.month.toString(), "M").MMM.toString(),
              style: const TextStyle(
                  color: MyColors.colorPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            dateTime = firstDateInMonth.add(Duration(days: daysInMonth));
            widget.onMonthChanged(dateTime);
          },
          icon: const Icon(
            Icons.arrow_right_rounded,
            size: 38.0,
            color: MyColors.colorPrimary,
          ),
        ),
      ],
    );
  }
}
