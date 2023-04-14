import 'package:jiffy/jiffy.dart';
import 'package:kamara_parent_app_ui/dummy_backend/students.dart';

class Attendance {
  final int year;
  final int month;
  final int id;
  Attendance({
    required this.year,
    required this.month,
    required this.id,
  });

  int daysInMonth() => Jiffy(DateTime(year, month, 1)).daysInMonth;
  Map<DateTime, String> generateAttendance() {
    final Map<DateTime, String> records = {};
    String status = "present";
    for (int day = 1; day <= daysInMonth(); day++) {
      if (_absent(day)) {
        status = "absent";
      }
      if (_late(day)) {
        status = "late";
      }
      if (_leave(day)) {
        status = "leave";
      }
      records.putIfAbsent(DateTime(year, month, day), () => status);
      // records[DateTime(year, month, day)] = status;
      status = "present";
    }
    return records;
  }

  bool _absent(int day) {
    int age = Students.all()[id]!.age;
    return [month + age + 5, month + age + 10, month + age + 13]
        .any((element) => element == day);
  }

  bool _late(int day) {
    int age = Students.all()[id]!.age;
    return [month + age + 1, month + age + 6].any((element) => element == day);
  }

  bool _leave(int day) {
    int age = Students.all()[id]!.age;
    return [month + age + 15].any((element) => element == day);
  }
}
