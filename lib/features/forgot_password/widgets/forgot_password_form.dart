import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/forgot_password/forgot_password.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.mediumPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _EmailInput(),
          const SizedBox(height: Sizes.medium),
          Text(
            'We will send you a link to reset your password',
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.onSecondary.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: Sizes.medium),
          const _SendPasswordResetEmailButton(),
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
    final l10n = ref.watch(l10nProvider) as AppLocalizations;
    final isValid = ref.watch(
      forgotPasswordControllerProvider.select((value) => value.email.isValid),
    );

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
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    return TextFormField(
      style: context.textTheme.bodyMedium,
      onChanged: notifier.onEmailChanged,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: l10n.emailHint,
      ),
    );
  }
}
