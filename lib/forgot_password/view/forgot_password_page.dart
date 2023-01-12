import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/forgot_password/cubit/cubit.dart';
import 'package:meddly/forgot_password/widgets/widgets.dart';

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
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(GetIt.I<AuthRepository>()),
      child: const Scaffold(
        body: ForgotPasswordView(),
      ),
    );
  }
}

/// {@template forgot_password_view}
/// Displays the Body of ForgotPasswordView
/// {@endtemplate}
class ForgotPasswordView extends StatelessWidget {
  /// {@macro forgot_password_view}
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordBody();
  }
}
