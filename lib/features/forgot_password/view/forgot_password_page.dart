import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/forgot_password/cubit/cubit.dart';
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
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(GetIt.I<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(),
        body: const ForgotPasswordView(),
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
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == FormzStatus.submissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.failure!.maybeWhen(
                    invalidEmail: () => context.l10n.invalidEmail,
                    userNotFound: () => context.l10n.userNotFound,
                    orElse: () => context.l10n.unknownError,
                  ),
                ),
              ),
            );
        }
      },
      child: const ForgotPasswordBody(),
    );
  }
}
