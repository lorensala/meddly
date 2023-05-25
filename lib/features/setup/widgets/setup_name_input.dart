import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/setup/controller/controller.dart';
import 'package:meddly/features/setup/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';

class SetupNameInput extends ConsumerWidget {
  const SetupNameInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final errorText = ref.watch(nameErrorMessageProvider);

    return TextFormField(
      onChanged: notifier.nameChanged,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: context.l10n.nameHint,
      ),
    );
  }
}
