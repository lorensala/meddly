import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/controller/appointment_controller.dart';
import 'package:meddly/features/appointment/view/view.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentDetailPage extends ConsumerWidget {
  const AppointmentDetailPage(this.id, {super.key});

  static String routeName = 'appointment_detail';
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = ref.watch(
      appointmentControllerProvider
          .select((value) => value.asData!.value.firstWhere((a) => a.id == id)),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nombre: ${appointment.name}'),
              Text('Especialidad: ${appointment.speciality}'),
              Text('Fecha: ${appointment.date}'),
              Text('Doctor: ${appointment.doctor}'),
              Text('Ubicación: ${appointment.location}'),
              Text('Notas: ${appointment.notes}'),
              const SizedBox(height: 8),
              Button(
                onPressed: () {
                  ref
                      .read(appointmentControllerProvider.notifier)
                      .deleteAppointment(id);

                  GoRouter.of(context).pop();
                },
                label: 'Delete',
              ),
              const SizedBox(height: 8),
              Button(
                onPressed: () {
                  GoRouter.of(context).push(
                    '${BrowsePage.routeName}/${AppointmentPage.routeName}/${AppointmentFormPage.routeName}',
                  );
                },
                label: 'Edit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
