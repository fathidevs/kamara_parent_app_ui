import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class Calendar {
  static DateTime now = DateTime(2023, 1, 6);
  static int lastDayOfTheMonth = Jiffy(now).daysInMonth;

  static List<DateTime> currentMonth() => List.generate(
        lastDayOfTheMonth,
        (day) => DateTime(now.year, now.month, day + 1),
      );

  // current date without time
  static DateTime nowNt() => DateTime(now.year, now.month, now.day);

  // true if past, general and simple check
  static isPast(DateTime dateTime) => now.compareTo(dateTime) == 1;
  // true if future, general and simple check
  static isFuture(DateTime dateTime) => now.compareTo(dateTime) == -1;

  // check if the given date is due today
  static bool isToday(DateTime dateTime) =>
      nowNt()
          .compareTo(DateTime(dateTime.year, dateTime.month, dateTime.day)) ==
      0;

  // check if the given date == past days in current month
  static bool isPastDayCurrentMonth(
    int year,
    int month,
    int day,
  ) {
    return nowNt().compareTo(DateTime(year, month, day)) == 1 &&
        now.month == month &&
        now.year == year;
  }

  // check if the given date == future days in current month
  static bool isFutureDayCurrentMonth(int day, int month, int year) =>
      now.day < day && now.month == month && now.year == year;

  // check if the given date is due past month/s in the current year
  static bool isPastMonth(DateTime dateTime) {
    return now.month > dateTime.month && now.year == dateTime.year;
  }

  // check if the given month is the next month/s in the current year
  static bool isNextMonth(DateTime dateTime) =>
      now.month < dateTime.month && now.year == dateTime.year;

  // check if the current year > given year
  static bool isPastYear(DateTime dateTime) => now.year > dateTime.year;

  // check if the current year < given year
  static bool isNextYear(DateTime dateTime) => now.year < dateTime.year;
}
