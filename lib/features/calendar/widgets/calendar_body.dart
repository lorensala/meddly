import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/widgets/widgets.dart';

/// {@template calendar_body}
/// Body of the CalendarPage.
///
/// Add what it does
/// {@endtemplate}
class CalendarBody extends StatelessWidget {
  /// {@macro calendar_body}
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CalendarDateAndDayIndicator(),
        CalendarDayList(),
        SizedBox(height: Sizes.medium),
        CalendarList(),
      ],
    );
  }
}
