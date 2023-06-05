import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/controller/appointment_controller.dart';
import 'package:meddly/features/appointment/core/core.dart';
import 'package:meddly/features/appointment/view/view.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentDetailPage extends ConsumerWidget {
  const AppointmentDetailPage(this.id, {super.key});

  static String routeName = 'appointment_detail';
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = ref.watch(appointmentControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Center(
          child: AsyncValueWidget(
            value: appointment,
            builder: (appointments) {
              final appointment =
                  appointments.firstWhereOrNull((a) => a.id == id);

              if (appointment == null) {
                return const Text('Appointment not found');
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.name,
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: Sizes.medium),
                  Text(
                    appointment.speciality!.localized(context.l10n),
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: Sizes.medium),
                  Text(
                    appointment.date.toHoursAndMinutesString(),
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: Sizes.medium),
                  Text(
                    appointment.doctor ?? '',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: Sizes.medium),
                  Text(
                    appointment.location ?? '',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: Sizes.medium),
                  Text(
                    appointment.notes ?? '',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: Sizes.large),
                  Button(
                    onPressed: () {
                      GoRouter.of(context).push(
                        '${BrowsePage.routeName}/${AppointmentPage.routeName}/${AppointmentFormPage.routeName}/${appointment.id}',
                      );
                    },
                    label: 'Editar turno médico',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
