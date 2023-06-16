import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentBody extends ConsumerWidget {
  const AppointmentBody(this.controller, {super.key});

  final TabController controller;

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

    return TabBarView(
      controller: controller,
      children: <Widget>[
        AsyncValueWidget(
          value: appointments,
          builder: (appointments) {
            final upcomingAppointments = appointments
                .where((appointment) => appointment.isUpcoming)
                .toList();

            if (upcomingAppointments.isEmpty) {
              return EmptyContainer(
                message: context.l10n.emptyUpcomingAppointments,
              );
            }

            return ListView.builder(
              itemCount: upcomingAppointments.length,
              itemBuilder: (context, index) {
                return ProviderScope(
                  overrides: [
                    appointmentProvider
                        .overrideWithValue(upcomingAppointments[index]),
                  ],
                  child: const AppointmentListItem(),
                );
              },
            );
          },
        ),
        AsyncValueWidget(
          value: appointments,
          builder: (appointments) {
            final pastAppointments = appointments
                .where((appointment) => !appointment.isUpcoming)
                .toList();

            if (pastAppointments.isEmpty) {
              return EmptyContainer(
                message: context.l10n.emptyPastAppointments,
              );
            }

            return ListView.builder(
              itemCount: pastAppointments.length,
              itemBuilder: (context, index) {
                return ProviderScope(
                  overrides: [
                    appointmentProvider
                        .overrideWithValue(pastAppointments[index]),
                  ],
                  child: const AppointmentListItem(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
