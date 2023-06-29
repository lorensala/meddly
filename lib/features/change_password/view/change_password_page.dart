import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/helpers.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/forgot_password/widgets/widgets.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  static String routeName = 'change-password';
  static String fullRouteName = '${UserPage.routeName}/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.changePassword),
      ),
      body: const ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends ConsumerWidget {
  const ChangePasswordView({super.key});

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
