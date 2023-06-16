import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';

class AppointmentDoctorInput extends ConsumerWidget {
  const AppointmentDoctorInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select((value) => value.isEditing),
    );
    final doctor = ref.watch(
      appointmentFormControllerProvider.select((value) => value.doctor.value),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: doctor,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onDoctorChanged,
          decoration: InputDecoration(
            filled: !isEditing,
            labelText: 'Nombre del médico',
            hintText: 'Ej: Dr. Juan Pérez',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
