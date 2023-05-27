import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/appointment/controller/appointment_controller.dart';
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nombre: ${appointment.name}'),
            Text('Especialidad: ${appointment.speciality}'),
            Text('Fecha: ${appointment.date}'),
            Text('Doctor: ${appointment.doctor}'),
            Text('Ubicación: ${appointment.location}'),
            Text('Notas: ${appointment.notes}'),
            Button(
              onPressed: () {
                ref
                    .read(appointmentControllerProvider.notifier)
                    .deleteAppointment(id);
                Navigator.pop(context);
              },
              label: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}
