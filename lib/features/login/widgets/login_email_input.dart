import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/controller/login_controller.dart';
import 'package:meddly/l10n/l10n.dart';

class EmailInput extends ConsumerWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: ref.watch(loginControllerProvider.notifier).onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: context.l10n.emailHint,
      ),
    );
  }
}
