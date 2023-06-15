import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/appointment/view/view.dart';
import 'package:meddly/features/appointment/widgets/appointment_body.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/l10n/l10n.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  static String routeName = 'appointment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appointments),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(
            '${BrowsePage.routeName}/${AppointmentPage.routeName}/${AppointmentFormPage.routeName}/""',
          );
        },
        tooltip: context.l10n.newAppointment,
        child: const Icon(Icons.add),
      ),
      body: const AppointmentBody(),
    );
  }
}
