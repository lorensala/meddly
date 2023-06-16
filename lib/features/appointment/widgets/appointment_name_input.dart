import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';

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
    final error = ref.watch(
      appointmentFormControllerProvider.select((value) => value.name.error),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: name,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onNameChanged,
          decoration: InputDecoration(
            labelText: '${context.l10n.nameHint} ${isEditing ? '*' : ''}',
            filled: !isEditing,
            errorText: error != null ? context.l10n.invalidName : null,
            hintText: 'Ej: Turno médico de cabecera',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
