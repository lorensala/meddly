import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentNotesInput extends HookConsumerWidget {
  const AppointmentNotesInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select((value) => value.isEditing),
    );
    final notes = ref.watch(
      appointmentFormControllerProvider.select((value) => value.notes),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: notes.value,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onNotesChanged,
          maxLength: 200,
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          decoration: InputDecoration(
            filled: !isEditing,
            labelText: context.l10n.notes,
            alignLabelWithHint: true,
            hintText: context.l10n.notesHint,
            suffixIcon: isEditing && notes.isValid && !notes.isPure
                ? const CircleCheck()
                : null,
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
