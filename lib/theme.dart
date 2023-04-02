import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class MyTheme {
  static ThemeData get() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: MyColors.colorPrimary,
          onPrimary: MyColors.colorOnPrimary,
          secondary: MyColors.colorSecondary,
          onSecondary: MyColors.primaryVariant,
          error: Colors.red),
    );
  }

  static ThemeData noSplash(BuildContext cx) {
    return Theme.of(cx).copyWith(
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
    );
  }

  static double calendarCardElevation = 5.0;
  static const double cardElevation = 5.0;
}
