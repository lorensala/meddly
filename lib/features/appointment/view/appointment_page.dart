import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/appointment/view/view.dart';
import 'package:meddly/features/appointment/widgets/appointment_body.dart';
import 'package:meddly/features/browse/browse.dart';

/// {@template appointment_page}
/// A description for AppointmentPage
/// {@endtemplate}
class AppointmentPage extends StatelessWidget {
  /// {@macro appointment_page}
  const AppointmentPage({super.key});

  /// The static route for AppointmentPage
  static String routeName = 'appointment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(
            '${BrowsePage.routeName}/${AppointmentPage.routeName}/${NewAppointmentPage.routeName}',
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: const AppointmentBody(),
    );
  }
}
