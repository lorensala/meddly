import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupBirthdateInput extends HookConsumerWidget {
  const SetupBirthdateInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final birthdate = ref.watch(setupBirthdateProvider);
    final errorText = ref.watch(birthdateErrorMessageProvider);

    final initialDateTime =
        DateTime.tryParse(birthdate.value) ?? DateTime.now();

    return DateSelector(
      initialDateTime: initialDateTime,
      onDateTimeChanged: (value) {
        notifier.birthdateChanged(value.toString());
      },
      errorText: errorText,
    );
  }
}
