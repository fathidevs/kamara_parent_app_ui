import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/dummy_backend/attendance.dart';
import 'package:kamara_parent_app_ui/notifier/picked_calendar_date.dart';
import 'package:kamara_parent_app_ui/notifier/picked_child_id_notifier.dart';
import 'package:provider/provider.dart';

class AttendanceIconFeedback {
  final String status;

  const AttendanceIconFeedback({
    required this.status,
  });

  IconData feedback() {
    switch (status) {
      case "present":
        return Icons.sentiment_very_satisfied_rounded;
      case "absent":
        return Icons.sentiment_very_dissatisfied_rounded;
      case "late":
        return Icons.sentiment_dissatisfied_rounded;
      case "leave":
        return Icons.sentiment_neutral_rounded;

      default:
        return Icons.hourglass_top_rounded;
    }
  }
}

class AttendanceFeedbackWidget extends StatelessWidget {
  const AttendanceFeedbackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    status() {
      DateTime dateTime = Provider.of<PickedCalendarDate>(context).dateTime;
      int id = Provider.of<PickedChildIdNotifier>(context).id;

      int year = dateTime.year;
      int month = dateTime.month;
      Attendance attendance = Attendance(year: year, month: month, id: id);
      String status = attendance.generateAttendance()[dateTime]!;

      return status;
    }

    IconData iconData =
        AttendanceIconFeedback(status: status().toLowerCase()).feedback();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Icon(
          iconData,
          color: status() == "present"
              ? MyColors.colorPrimary
              : MyColors.hintColor,
        )),
        Expanded(
          flex: 2,
          child: Text(
            status(),
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18.0,
              color: status() == "present"
                  ? MyColors.colorPrimary
                  : MyColors.hintColor,
            ),
          ),
        ),
      ],
    );
  }
}
