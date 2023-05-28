import 'package:flutter/material.dart';
import 'package:meddly/features/calendar/widgets/calendar_body.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CalendarPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: const CalendarView(),
    );
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalendarBody();
  }
}
