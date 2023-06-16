import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:medicine/medicine.dart';

class AppointmentDateSelector extends StatelessWidget {
  const AppointmentDateSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: _DateInput(),
            ),
            SizedBox(width: Sizes.medium),
            Expanded(
              child: _TimeInput(),
            ),
          ],
        ),
        SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class _TimeInput extends HookConsumerWidget {
  const _TimeInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final time = ref.watch(
      appointmentFormControllerProvider.select((value) => value.time.value),
    );
    final controller = useTextEditingController(
      text: time?.toHHmm(),
    );
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select((value) => value.isEditing),
    );

    ref.listen<AppointmentFormState>(
      appointmentFormControllerProvider,
      (_, state) {
        controller.text = state.time.value?.toHHmm() ?? '';
      },
    );

    return TextFormField(
      enabled: isEditing,
      controller: controller,
      readOnly: true,
      maxLines: null,
      style: context.textTheme.bodyMedium,
      onTap: () async {
        final time = await showAdaptiveTimePicker(
          context: context,
          initialTimeOfDay: TimeOfDay.now(),
        );

        if (time == null) return;

        notifier.onTimeChanged(time);
      },
      onChanged: notifier.onNameChanged,
      decoration: InputDecoration(
        suffixText: 'hrs',
        filled: !isEditing,
        labelText: '${context.l10n.time}${isEditing ? '*' : ''}',
      ),
    );
  }
}

class _DateInput extends HookConsumerWidget {
  const _DateInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final date = ref.watch(
      appointmentFormControllerProvider.select((value) => value.date.value),
    );
    final controller = useTextEditingController(
      text: date?.localizedString(context),
    );
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select((value) => value.isEditing),
    );

    ref.listen<AppointmentFormState>(
      appointmentFormControllerProvider,
      (_, state) {
        controller.text = state.date.value?.localizedString(context) ?? '';
      },
    );

    return TextFormField(
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

        notifier.onDateChanged(
          DateTime(
            value.year,
            value.month,
            value.day,
          ),
        );
      },
      onChanged: notifier.onNameChanged,
      maxLines: null,
      decoration: InputDecoration(
        filled: !isEditing,
        labelText: '${context.l10n.date}${isEditing ? '*' : ''}',
      ),
    );
  }
}
