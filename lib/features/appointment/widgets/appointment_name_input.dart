import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
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
      appointmentFormControllerProvider.select((value) => value.name),
    );
    final hasError = ref.watch(
      appointmentFormControllerProvider
          .select((value) => !value.name.isPure && value.name.error != null),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: name.value,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onNameChanged,
          decoration: InputDecoration(
            labelText: '${context.l10n.appointment}${isEditing ? '*' : ''}',
            filled: !isEditing,
            errorText: hasError ? context.l10n.invalidName : null,
            hintText: context.l10n.appointmentHint,
            suffixIcon: isEditing && name.isValid ? const CircleCheck() : null,
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
