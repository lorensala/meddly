import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentDateSelector extends ConsumerWidget {
  const AppointmentDateSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select((value) => value.isEditing),
    );
    final dateTime = ref.watch(
      appointmentFormControllerProvider.select((value) => value.dateTime.value),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Fecha y hora', isRequired: true),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          initialValue: dateTime?.toDayMonthYearHourMinuteString(),
          enabled: isEditing,
          readOnly: true,
          style: context.textTheme.bodyMedium,
          onTap: () async {
            final value = await showAdaptiveDatePicker(
              context: context,
              initialDateTime: DateTime.now(),
            );

            if (value == null) return;

            // ignore: use_build_context_synchronously
            final time = await showAdaptiveTimePicker(
              context: context,
              initialTimeOfDay: TimeOfDay.now(),
            );

            if (time == null) return;

            notifier.onDateChanged(
              DateTime(
                value.year,
                value.month,
                value.day,
                time.hour,
                time.minute,
              ),
            );
          },
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
