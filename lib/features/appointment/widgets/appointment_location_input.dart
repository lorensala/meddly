import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

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
      appointmentFormControllerProvider.select((value) => value.location),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const InputLabel(label: 'Ubicación', isRequired: false),
        // const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          initialValue: location.value,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onLocationChanged,
          decoration: InputDecoration(
            filled: !isEditing,
            labelText: context.l10n.place,
            hintText: context.l10n.placeHint,
            suffixIcon: isEditing && location.isValid && !location.isPure
                ? const CircleCheck()
                : null,
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
