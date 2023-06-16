import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentNameInput extends ConsumerWidget {
  const AppointmentNameInput({
    this.appointment,
    super.key,
  });

  final Appointment? appointment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select((value) => value.isEditing),
    );
    final name = ref.watch(
      appointmentFormControllerProvider.select((value) => value.name.value),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Nombre', isRequired: true),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          initialValue: name,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onNameChanged,
          decoration: InputDecoration(
            filled: !isEditing,
            hintText: 'Ej: Turno médico de cabecera',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
