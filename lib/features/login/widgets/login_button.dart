import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/login/controller/login_controller.dart';
import 'package:meddly/features/login/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider).isLoading;
    final isValid = ref.watch(isLoginFormValidProvider);

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: () => ref
          .watch(loginControllerProvider.notifier)
          .logInWithEmailAndPassword(),
      label: context.l10n.login,
    );
  }
}
