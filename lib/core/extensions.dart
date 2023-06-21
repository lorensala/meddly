import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:meddly/l10n/l10n.dart';

extension StringX on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

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
  String toLocalizedDayString(AppLocalizations l10n) {
    if (this == 1) {
      return '$this ${l10n.day}';
    } else {
      return '$this ${l10n.days}';
    }
  }
}

extension DoubleX on double {
  String truncate() => toStringAsFixed(
        truncateToDouble() == this ? 0 : 2,
      );
}

extension TimeOfDayX on TimeOfDay {
  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  TimeOfDay fromString(String s) {
    // string in format "08:10:"
    final hour = int.parse(s.substring(0, 2));
    final minute = int.parse(s.substring(3, 5));

    return TimeOfDay(hour: hour, minute: minute);
  }
}

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get height =>
      MediaQuery.sizeOf(this).height -
      kToolbarHeight -
      kBottomNavigationBarHeight;
  double get width => MediaQuery.sizeOf(this).width;
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

  String toNamedMonthString(BuildContext context) =>
      DateFormat('MMMM', 'es').format(this).capitalize();

  String localizedString(BuildContext context) {
    String? namedDay;

    // check if is yesterday
    if (isYesterday(this)) {
      namedDay = context.l10n.yesterday;
      // check if is tomorrow
    } else if (isTomorrow(this)) {
      namedDay = context.l10n.tomorow;
      // check if is today
    } else if (isToday()) {
      namedDay = context.l10n.today;
    }

    // return named day
    if (namedDay != null) {
      return '$namedDay, $day ${toNamedMonthString(context)}';
    } else {
      return '${localizedDay(context)} $day ${toNamedMonthString(context)}';
    }
  }

  String localizedDay(BuildContext context) =>
      DateFormat('EEE', Localizations.localeOf(context).languageCode)
          .format(this)
          .capitalize();
}

extension RefDebounceX on Ref {
  /// Delays an execution by a bit such that if a dependency changes multiple
  /// time rapidly, the rest of the code is only run once.
  Future<void> debounce(Duration duration) {
    final completer = Completer<void>();
    final timer = Timer(duration, () {
      if (!completer.isCompleted) completer.complete();
    });
    onDispose(() {
      timer.cancel();
      if (!completer.isCompleted) {
        completer.completeError(StateError('Cancelled'));
      }
    });
    return completer.future;
  }
}

extension ShimmerX on Widget {
  Animate customShimmer() {
    return animate(
      onPlay: (controller) => controller.repeat(),
    ).shimmer(
      duration: const Duration(seconds: 1),
    );
  }
}

extension TextStyleX on TextStyle {
  TextStyle underlined({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
  }) {
    return copyWith(
      shadows: [
        Shadow(
          color: this.color ?? Colors.black,
          offset: Offset(0, -distance),
        )
      ],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationThickness: thickness,
      decorationColor: color ?? this.color,
      decorationStyle: style,
    );
  }
}
