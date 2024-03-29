import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentBody extends ConsumerWidget {
  const AppointmentBody(this.controller, {super.key});

  final TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointments = ref.watch(appointmentControllerProvider);
    final filteredAppointments = ref.watch(filteredAppointmentsProvider);

    return TabBarView(
      controller: controller,
      children: <Widget>[
        AsyncValueWidget(
          value: appointments,
          onRetry: () =>
              ref.read(appointmentControllerProvider.notifier).refresh(),
          builder: (appointments) {
            if (appointments.isEmpty) {
              return EmptyContainer(
                message: context.l10n.emptyUpcomingAppointments,
              );
            }

            if (filteredAppointments.isEmpty) {
              return EmptyContainer(
                message: context.l10n.emptyFilteredAppointments,
              );
            }

            final upcomingAppointments = filteredAppointments
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
          onRetry: () =>
              ref.read(appointmentControllerProvider.notifier).refresh(),
          builder: (appointments) {
            if (appointments.isEmpty) {
              return EmptyContainer(
                message: context.l10n.emptyUpcomingAppointments,
              );
            }

            if (filteredAppointments.isEmpty) {
              return EmptyContainer(
                message: context.l10n.emptyFilteredAppointments,
              );
            }

            final pastAppointments = filteredAppointments
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
