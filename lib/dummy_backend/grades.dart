import 'package:kamara_parent_app_ui/dummy_backend/models/grades_model.dart';

class Grades {
  final int id;
  const Grades({
    required this.id,
  });

  Map<int, List<GradeModel>> _make() {
    return {
      0: [
        const GradeModel(subjectName: "Mathematics", grade: 8.0),
        const GradeModel(subjectName: "Science", grade: 4.0),
        const GradeModel(subjectName: "Computer", grade: 6.0),
        const GradeModel(subjectName: "Geology", grade: 7.0),
        const GradeModel(subjectName: "Geography", grade: 3.0),
        const GradeModel(subjectName: "Quran", grade: 10.0),
        const GradeModel(subjectName: "Hadith", grade: null),
        const GradeModel(subjectName: "Art", grade: null),
        const GradeModel(subjectName: "Physical Education", grade: null),
      ],
      1: [
        const GradeModel(subjectName: "Science", grade: 4.0),
        const GradeModel(subjectName: "Geography", grade: 3.0),
        const GradeModel(subjectName: "Quran", grade: 10.0),
        const GradeModel(subjectName: "Hadith", grade: null),
        const GradeModel(subjectName: "Mathematics", grade: 8.0),
        const GradeModel(subjectName: "Art", grade: null),
      ],
      2: [
        const GradeModel(subjectName: "Quran", grade: 10.0),
        const GradeModel(subjectName: "Hadith", grade: null),
        const GradeModel(subjectName: "Mathematics", grade: 8.0),
        const GradeModel(subjectName: "Art", grade: null),
      ],
    };
  }

  List<GradeModel> get() {
    return _make()[id]!;
  }
}
