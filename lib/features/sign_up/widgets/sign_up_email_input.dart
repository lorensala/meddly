import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/controller/controller.dart';
import 'package:meddly/features/sign_up/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';

class SignUpEmailInput extends ConsumerWidget {
  const SignUpEmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(emailErrorMessageProvider);
    final notifier = ref.watch(signUpControllerProvider.notifier);

    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: notifier.onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: context.l10n.emailHint,
        errorText: errorText,
        errorMaxLines: 2,
      ),
    );
  }
}
