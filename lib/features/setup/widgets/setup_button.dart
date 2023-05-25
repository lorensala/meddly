import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/features/user/controller/controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupButton extends ConsumerWidget {
  const SetupButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(setupControllerProvider.notifier);
    final isValid = ref.watch(requiredFieldsAreValidProvider);
    final isLoading = ref.watch(userControllerProvider).isLoading;

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: notifier.save,
      label: context.l10n.createAccount,
    );
  }
}
