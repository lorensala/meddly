import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/sign_up/sign_up.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signUpControllerProvider.notifier);
    final isFormValid = ref.watch(isSignUpFormValidProvider);
    final isLoading = ref.watch(authControllerProvider).isLoading;

    return Button(
      isValid: isFormValid,
      isLoading: isLoading,
      onPressed: notifier.registerWithEmailAndPassword,
      label: context.l10n.signUp,
    );
  }
}
