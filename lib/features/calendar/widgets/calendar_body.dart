import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/widgets/widgets.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CalendarDateAndDayIndicator(),
        CalendarDayList(),
        SizedBox(height: Sizes.medium),
        CalendarList(),
      ],
    );
  }
}
