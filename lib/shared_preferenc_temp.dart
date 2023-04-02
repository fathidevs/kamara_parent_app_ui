import 'package:kamara_parent_app_ui/dummy_backend/models/attendance_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sp {
  final String key;
  final dynamic value;

  const Sp({
    required this.key,
    this.value,
  });

  dynamic get() async {
    final sp = await SharedPreferences.getInstance();
    return sp.get(key);
  }

  void int() async {
    final sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
  }

  void double() async {
    final sp = await SharedPreferences.getInstance();
    sp.setDouble(key, value);
  }

  void bool() async {
    final sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  void string() async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }
}
