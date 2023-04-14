import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/theme.dart';

class CardStyle {
  final bool isToday;
  final bool isPastDay;
  final bool isNextMonth;
  final bool isPastMonth;
  final bool isPastYear;

  const CardStyle({
    this.isToday = false,
    this.isPastDay = false,
    this.isNextMonth = false,
    this.isPastMonth = false,
    this.isPastYear = false,
  });
  double elevation() {
    if (isToday || isPastDay || isPastMonth || isNextMonth || isPastYear) {
      return 0.0;
    }
    return MyTheme.calendarCardElevation;
  }

  static Color shadowColor() => Colors.black38;
  ShapeBorder shape(BorderRadius radius) {
    if (isToday) {
      return RoundedRectangleBorder(
          borderRadius: radius,
          side: const BorderSide(
            color: MyColors.colorPrimary,
            width: 1.5,
          ));
    }
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: cardColor(),
          width: 1.5,
        ));
  }

  Color cardColor() {
    if (isPastDay) {
      return MyColors.colorPrimary;
    }
    if (isToday) {
      return Colors.transparent;
    }
    if (isPastYear || isPastMonth) {
      return MyColors.dissabledBgColr;
    }

    return Colors.white;
  }

  TextStyle textStyle(FontWeight fontWeightx) {
    if (isPastDay) {
      return TextStyle(
        color: MyColors.colorOnPrimary,
        fontWeight: fontWeightx,
      );
    }
    if (isToday) {
      return TextStyle(
        color: MyColors.colorPrimary,
        fontWeight: fontWeightx,
        fontSize: 15.0,
      );
    }
    if (isPastYear || isPastMonth) {
      return TextStyle(
          color: MyColors.dissabledTextColr, fontWeight: fontWeightx);
    }
    if (isNextMonth) {
      return TextStyle(
          color: MyColors.dissabledTextColr, fontWeight: fontWeightx);
    }

    return TextStyle(color: Colors.black87, fontWeight: fontWeightx);
  }
}
