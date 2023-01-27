import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/calendar/bloc/bloc.dart';
import 'package:meddly/features/calendar/widgets/calendar_body.dart';

/// {@template calendar_page}
/// A description for CalendarPage
/// {@endtemplate}
class CalendarPage extends StatelessWidget {
  /// {@macro calendar_page}
  const CalendarPage({super.key});

  /// The static route for CalendarPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CalendarPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CalendarBloc(calendarRepository: GetIt.I.get<CalendarRepository>()),
      child: const Scaffold(
        body: CalendarView(),
      ),
    );
  }
}

/// {@template calendar_view}
/// Displays the Body of CalendarView
/// {@endtemplate}
class CalendarView extends StatefulWidget {
  /// {@macro calendar_view}
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  void initState() {
    context.read<CalendarBloc>().add(const CalendarEvent.fetchAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CalendarBody();
  }
}
