import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

extension StringX on String {
  String capitalize() => split(' ').map((word) {
        return word.substring(0, 1).toUpperCase() +
            word.substring(1).toLowerCase();
      }).join(' ');

  String dateTimeStringFormat() =>
      '${substring(8, 10)}/${substring(5, 7)}/${substring(0, 4)}';

  String separateWithCapitalize() {
    final words = split(' ');
    if (words.length == 1) {
      return capitalize();
    } else {
      return words.map((word) => word.capitalize()).join(' ');
    }
  }
}

extension IntX on int {
  String toDaysString() {
    if (this == 1) {
      return '$this Day';
    } else {
      return '$this Days';
    }
  }
}

extension TimeOfDayX on TimeOfDay {
  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension DateTimeX on DateTime {
  String toHoursAndMinutesString() =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  bool isToday() {
    final today = DateTime.now();
    return today.year == year && today.month == month && today.day == day;
  }

  bool isSameDay(DateTime date) {
    return date.year == year && date.month == month && date.day == day;
  }

  bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.year == date.year &&
        tomorrow.month == date.month &&
        tomorrow.day == date.day;
  }

  bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.year == date.year &&
        yesterday.month == date.month &&
        yesterday.day == date.day;
  }

  String toNamedMonthString() {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'Unknown';
    }
  }

  String toNamedDayString() {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }

  String toNamedDayNumberAndMonthString() {
    String? namedDay;

    // check if is yesterday
    if (isYesterday(this)) {
      namedDay = 'Yesterday';
      // check if is tomorrow
    } else if (isTomorrow(this)) {
      namedDay = 'Tomorrow';
      // check if is today
    } else if (isToday()) {
      namedDay = 'Today';
    }

    // return named day
    if (namedDay != null) {
      return '$namedDay, $day ${toNamedMonthString()}';
    } else {
      return '${toNamedDayString()} $day ${toNamedMonthString()}';
    }
  }
}

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right<L, R>).value; //
  L asLeft() => (this as Left<L, R>).value;
}
