import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/controller/appointment_controller.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentBody extends ConsumerWidget {
  const AppointmentBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appointmentControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) {
          showSnackBar(context, err.toString());
        },
      );
    });

    final appointments = ref.watch(appointmentControllerProvider);

    return AsyncValueWidget(
      value: appointments,
      builder: (appointments) {
        return ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(appointments[index].name),
              subtitle: Text(appointments[index].location ?? ''),
            );
          },
        );
      },
    );
  }
}
