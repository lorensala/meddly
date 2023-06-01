import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';

class SetupHeightInput extends ConsumerWidget {
  const SetupHeightInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final errorText = ref.watch(heightErrorMessageProvider);

    return TextFormField(
      style: context.textTheme.bodyMedium,
      onChanged: notifier.heightChanged,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: context.l10n.heightHint,
        suffixText: 'cm',
      ),
    );
  }
}
