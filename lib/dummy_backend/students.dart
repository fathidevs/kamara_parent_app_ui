import 'models/student_model.dart';

class Students {
  final int id;
  const Students({
    required this.id,
  });

  static Map<int, StudentModel> _make() {
    return {
      0: const StudentModel(
        id: 0,
        name: "Mohamed Fathi Omar",
        age: 14,
        img: "assets/img/14kid.jpg",
      ),
      1: const StudentModel(
        id: 1,
        name: "Omar Fathi Omar",
        age: 10,
        img: "assets/img/10kid.jpg",
      ),
      2: const StudentModel(
        id: 2,
        name: "Othman Fathi Omar",
        age: 8,
        img: "assets/img/8kid.jpg",
      ),
    };
  }

  StudentModel get() {
    return _make()[id]!;
  }

  static Map<int, StudentModel> all() {
    return _make();
  }
}
