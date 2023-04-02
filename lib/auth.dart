/*
  This is a dummy class to demonstarte the process of checking
  the user credentials.
*/

import 'package:kamara_parent_app_ui/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static Future<bool> check() async {
    /*
      this function returns True if 
      the user has inputed anything
       in the Email field.
    */
    final sp = await SharedPreferences.getInstance();
    return sp.containsKey(Keys.parentEmail);
  }

  static bool success() {
    /*
      this function returns True if 
      check() is True.
    */
    bool authVal = false;
    check().then((value) => authVal = value);
    return authVal;
  }

  static void set(String value) async {
    final sp = await SharedPreferences.getInstance();
    if (value.isNotEmpty) {
      sp.setString(Keys.parentEmail, value);
    }
  }

  static void clear() async {
    final sp = await SharedPreferences.getInstance();
    sp.remove(Keys.parentEmail);
  }
}
