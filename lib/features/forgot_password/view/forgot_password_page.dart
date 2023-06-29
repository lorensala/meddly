import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/helpers.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/forgot_password/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ForgotPasswordPage(),
    );
  }

  static String routeName = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.forgotPassword),
      ),
      body: const ForgotPasswordView(),
    );
  }
}

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) => showSnackBar(context, err.toString()),
      );
    });

    return const ForgotPasswordBody();
  }
}
