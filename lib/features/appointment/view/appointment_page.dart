import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/appointment/view/view.dart';
import 'package:meddly/features/appointment/widgets/appointment_body.dart';
import 'package:meddly/features/browse/browse.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

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
            '${BrowsePage.routeName}/${AppointmentPage.routeName}/${AppointmentFormPage.routeName}',
          );
        },
        tooltip: 'Nuevo turno médico',
        child: const Icon(Icons.add),
      ),
      body: const AppointmentBody(),
    );
  }
}
