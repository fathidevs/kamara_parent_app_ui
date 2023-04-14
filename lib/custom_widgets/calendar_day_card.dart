import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/vibrator.dart';
import 'package:provider/provider.dart';

import '../calendar_data/calendar.dart';
import '../calendar_data/card_style.dart';
import '../dummy_backend/attendance.dart';
import '../notifier/picked_calendar_date.dart';
import 'attendance_notifier_widget.dart';

class CalendarDayCard extends StatefulWidget {
  final DateTime dateTime;
  final Function onPressed;
  final BorderRadius radius;
  final int id;
  final bool isFutureFeedback;
  final FontWeight fontWeight;

  const CalendarDayCard({
    Key? key,
    required this.dateTime,
    required this.onPressed(Map<DateTime, String> status),
    required this.id,
    this.radius = const BorderRadius.all(
      Radius.circular(8.0),
    ),
    this.isFutureFeedback = true,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  State<CalendarDayCard> createState() => CalendarDayCardState();
}

class CalendarDayCardState extends State<CalendarDayCard> {
  @override
  Widget build(BuildContext context) {
    bool isTody = Calendar.isToday(widget.dateTime);
    bool isPastDay = Calendar.isPastDayCurrentMonth(
      widget.dateTime.year,
      widget.dateTime.month,
      widget.dateTime.day,
    );
    bool isPastMonth = Calendar.isPastMonth(widget.dateTime);
    bool isNextMonth = Calendar.isNextMonth(widget.dateTime);
    bool isPastYear = Calendar.isPastYear(widget.dateTime);

    CardStyle style = CardStyle(
      isToday: isTody,
      isPastDay: isPastDay,
      isPastMonth: isPastMonth,
      isNextMonth: isNextMonth,
      isPastYear: isPastYear,
    );
    String attendance = Attendance(
      id: widget.id,
      month: widget.dateTime.month,
      year: widget.dateTime.year,
    ).generateAttendance()[widget.dateTime]!;

    Map<DateTime, String> status = {widget.dateTime: attendance};
    PickedCalendarDate pickedDate(bool listen) {
      return Provider.of<PickedCalendarDate>(context, listen: listen);
    }

    return Card(
      elevation: style.elevation(),
      shadowColor: CardStyle.shadowColor(),
      color: style.cardColor(),
      shape: style.shape(widget.radius),
      child: InkWell(
        borderRadius: widget.radius,
        onTap: () {
          if (widget.isFutureFeedback && Calendar.isFuture(widget.dateTime)) {
            Vibrator.vibrate();
          } else {
            pickedDate(false).changeDate(widget.dateTime);
            widget.onPressed(status);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .1,
          height: MediaQuery.of(context).size.width * .1,
          child: Calendar.isPast(widget.dateTime)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.dateTime.day.toString().padLeft(2, '0'),
                      style: style.textStyle(widget.fontWeight),
                      textAlign: TextAlign.center,
                    ),
                    AttendanceNotifierWidget(
                      dateTime: widget.dateTime,
                      status: Attendance(
                              id: widget.id,
                              month: widget.dateTime.month,
                              year: widget.dateTime.year)
                          .generateAttendance()[widget.dateTime]!,
                    )
                  ],
                )
              : Text(
                  widget.dateTime.day.toString().padLeft(2, '0'),
                  style: style.textStyle(widget.fontWeight),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
