import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';

class AppointmentLocationInput extends ConsumerWidget {
  const AppointmentLocationInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select((value) => value.isEditing),
    );
    final location = ref.watch(
      appointmentFormControllerProvider.select((value) => value.location.value),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const InputLabel(label: 'Ubicación', isRequired: false),
        // const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          initialValue: location,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onLocationChanged,
          decoration: InputDecoration(
            filled: !isEditing,
            labelText: 'Ubicación',
            hintText: 'Ej: Hospital Italiano',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
