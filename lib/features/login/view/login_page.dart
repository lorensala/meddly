import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/helpers.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/login/widgets/login_body.dart';
import 'package:meddly/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  /// The static route for LoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.login),
        leading: const BackButton(),
      ),
      body: const LoginView(),
    );
  }
}

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, stackTrace) => showSnackBar(
          context,
          err.toString(),
        ),
      );
    });
    return const LoginBody();
  }
}
