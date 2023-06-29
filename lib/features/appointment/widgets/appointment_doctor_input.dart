import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

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
      appointmentFormControllerProvider.select((value) => value.doctor),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: doctor.value,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onDoctorChanged,
          decoration: InputDecoration(
            filled: !isEditing,
            labelText: context.l10n.doctor,
            hintText: context.l10n.doctorHint,
            suffixIcon: isEditing && doctor.isValid && !doctor.isPure
                ? const CircleCheck()
                : null,
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
