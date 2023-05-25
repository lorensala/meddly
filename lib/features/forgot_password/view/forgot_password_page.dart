import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/helpers.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/forgot_password/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template forgot_password_page}
/// A description for ForgotPasswordPage
/// {@endtemplate}
class ForgotPasswordPage extends StatelessWidget {
  /// {@macro forgot_password_page}
  const ForgotPasswordPage({super.key});

  /// The static route for ForgotPasswordPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ForgotPasswordPage(),
    );
  }

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

/// {@template forgot_password_view}
/// Displays the Body of ForgotPasswordView
/// {@endtemplate}
class ForgotPasswordView extends ConsumerWidget {
  /// {@macro forgot_password_view}
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
