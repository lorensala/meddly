import 'package:flutter/material.dart';
import 'package:meddly/features/calendar/bloc/bloc.dart';
import 'package:meddly/features/calendar/widgets/calendar_list.dart';

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
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return const CalendarList();
      },
    );
  }
}
