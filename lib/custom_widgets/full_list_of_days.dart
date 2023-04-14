import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/notifier/picked_calendar_date.dart';
import 'package:provider/provider.dart';

import 'calendar_day_card.dart';

class FullListOfDays extends StatefulWidget {
  final int id;
  final DateTime dateTime;
  final double xSpace;
  final double ySpace;
  final EdgeInsets padding;

  const FullListOfDays({
    Key? key,
    required this.id,
    required this.dateTime,
    this.xSpace = 3.0,
    this.ySpace = 3.0,
    this.padding = const EdgeInsets.all(10.0),
  }) : super(key: key);

  @override
  State<FullListOfDays> createState() => _FullListOfDaysState();
}

class _FullListOfDaysState extends State<FullListOfDays> {
  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth =
        DateTime(widget.dateTime.year, widget.dateTime.month, 1);

    int firstDayOfMonthPosition = firstDayOfMonth.weekday;

    DateTime dateTime =
        firstDayOfMonth.subtract(Duration(days: firstDayOfMonthPosition));
    DateTime pickedDate = Provider.of<PickedCalendarDate>(context).dateTime;

    List<CalendarDayCard> listOfDays() {
      return List.generate(7 * 6, (dayCtr) {
        // dayCtr starts with 0, and day is always > 0
        int day = dayCtr + 1;

        DateTime generatedDate = dateTime.add(Duration(days: day));
        return CalendarDayCard(
          isFutureFeedback: false,
          dateTime: generatedDate,
          onPressed: (status) {},
          id: widget.id,
          fontWeight:
              pickedDate == generatedDate ? FontWeight.w900 : FontWeight.normal,
        );
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        header(),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: widget.padding,
          shrinkWrap: true,
          crossAxisCount: 7,
          crossAxisSpacing: widget.xSpace,
          mainAxisSpacing: widget.ySpace,
          children: listOfDays(),
        ),
      ],
    );
  }

  Widget header() {
    Map<int, String> days = {
      0: "Mon",
      1: "Tue",
      2: "Wed",
      3: "Thu",
      4: "Fri",
      5: "Sat",
      6: "Sun",
    };
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: widget.padding,
      shrinkWrap: true,
      crossAxisCount: 7,
      crossAxisSpacing: widget.xSpace,
      children: List.generate(
          7,
          (index) => Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                days[index]!,
                style: const TextStyle(fontSize: 12.0),
              ))),
    );
  }
}
