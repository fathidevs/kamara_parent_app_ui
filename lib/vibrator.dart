import 'package:vibration/vibration.dart';

class Vibrator {
  static Future<bool?> _valid() async => await Vibration.hasVibrator();
  static vibrate() async {
    if (await _valid() ?? false) {
      Vibration.vibrate(duration: 250);
    }
  }
}
