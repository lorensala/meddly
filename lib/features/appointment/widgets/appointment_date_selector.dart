import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';

class AppointmentDateSelector extends HookConsumerWidget {
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
    final controller = useTextEditingController(
      text: dateTime?.toDayMonthYearHourMinuteString(),
    );

    ref.listen<AppointmentFormState>(
      appointmentFormControllerProvider,
      (_, state) {
        controller.text =
            state.dateTime.value?.toDayMonthYearHourMinuteString() ?? '';
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: isEditing,
          controller: controller,
          readOnly: true,
          style: context.textTheme.bodyMedium,
          onTap: () async {
            final value = await showAdaptiveDatePicker(
              context: context,
              initialDateTime: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
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
            labelText: 'Fecha y hora${isEditing ? '*' : ''}',
            hintText: 'Ej: 12/12/2021 12:00',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
