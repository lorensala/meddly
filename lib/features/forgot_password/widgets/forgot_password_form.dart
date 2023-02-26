import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/forgot_password/controller/forgot_password_controller.dart';
import 'package:meddly/features/forgot_password/provider/forgot_password_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.padding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _EmailInput(),
          SizedBox(height: Sizes.mediumSpacing),
          _SendPasswordResetEmailButton(),
        ],
      ),
    );
  }
}

class _SendPasswordResetEmailButton extends ConsumerWidget {
  const _SendPasswordResetEmailButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(forgotPasswordControllerProvider.notifier);
    final isLoading = ref.watch(authControllerProvider).isLoading;
    final l10n = ref.watch(l10nProvider);
    final isValid = ref.watch(isForgotPasswordEmailValidProvider);

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: notifier.sendPasswordResetEmail,
      label: l10n.sendPasswordResetEmail,
    );
  }
}

class _EmailInput extends ConsumerWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(forgotPasswordControllerProvider.notifier);
    final errorText = ref.watch(forgotPasswordEmailErrorProvider);
    final l10n = ref.watch(l10nProvider);

    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      onChanged: notifier.onEmailChanged,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: l10n.emailHint,
      ),
    );
  }
}
