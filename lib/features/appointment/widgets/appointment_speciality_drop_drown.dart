import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

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
        const InputLabel(label: 'Especialidad', isRequired: true),
        const SizedBox(height: Sizes.extraSmall),
        Container(
          width: double.infinity,
          height: Sizes.large * 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.small),
            border: Border.all(
              color: context.colorScheme.surface,
              width: 1.5,
            ),
          ),
          child: DropDownSelector<AppointmentSpeciality>(
            value: value!,
            enabled: isEditing,
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
            onChanged: (value) => notifier.onSpecialityChanged(value!),
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
