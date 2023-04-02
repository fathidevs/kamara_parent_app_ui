import 'package:kamara_parent_app_ui/dummy_backend/grades.dart';

class Subjects {
  final Grades grades;
  const Subjects({
    required this.grades,
  });

  List<String> get() {
    return grades.get().map((e) => e.subjectName).toList();
  }
}
