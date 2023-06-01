import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/appointment/controller/appointment_controller.dart';
import 'package:meddly/features/appointment/view/view.dart';
import 'package:meddly/features/browse/browse.dart';
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
        if (appointments.isEmpty) {
          return const EmptyContainer(message: 'No hay turnos médicos');
        }

        return ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            return ProviderScope(
              overrides: [
                appointmentProvider.overrideWithValue(appointments[index]),
              ],
              child: const AppointmentListTile(),
            );
          },
        );
      },
    );
  }
}

class AppointmentListTile extends ConsumerWidget {
  const AppointmentListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = ref.watch(appointmentProvider);
    return ListTile(
      title: Text(appointment.name),
      subtitle: Text(appointment.location ?? ''),
      onTap: () => GoRouter.of(context).go(
        '${BrowsePage.routeName}/${AppointmentPage.routeName}/${AppointmentDetailPage.routeName}/${appointment.id}',
      ),
    );
  }
}
