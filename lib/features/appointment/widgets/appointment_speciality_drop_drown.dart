import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';

class AppointmentSpecialityDropDown extends HookConsumerWidget {
  const AppointmentSpecialityDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final value = ref.watch(
      appointmentFormControllerProvider
          .select((value) => value.speciality.value),
    );
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select((value) => value.isEditing),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<AppointmentSpeciality>(
          value: value,
          decoration: InputDecoration(
            labelText: 'Especialidad${isEditing ? '*' : ''}',
            filled: !isEditing,
          ),
          items: AppointmentSpeciality.values
              .map(
                (e) => DropdownMenuItem<AppointmentSpeciality>(
                  value: e,
                  child: Text(
                    e.localized(context.l10n),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: !isEditing
              ? null
              : (value) => notifier.onSpecialityChanged(value!),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
