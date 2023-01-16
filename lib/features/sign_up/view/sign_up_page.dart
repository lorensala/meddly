import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/sign_up/cubit/cubit.dart';
import 'package:meddly/features/sign_up/widgets/sign_up_body.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template sign_up_page}
/// A description for SignUpPage
/// {@endtemplate}
class SignUpPage extends StatelessWidget {
  /// {@macro sign_up_page}
  const SignUpPage({super.key});

  /// The static route for SignUpPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(GetIt.I<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(),
        body: const SignUpView(),
      ),
    );
  }
}

/// {@template sign_up_view}
/// Displays the Body of SignUpView
/// {@endtemplate}
class SignUpView extends StatelessWidget {
  /// {@macro sign_up_view}
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context)
              .pushAndRemoveUntil(UserPage.route(), (_) => false);
        }
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.failure!.maybeWhen(
                    orElse: () => context.l10n.unknownError,
                    accountsExistsWithDifferentCredentials: () =>
                        context.l10n.accountsExistsWithDifferentCredentials,
                    serverError: () => context.l10n.serverError,
                    emailAlreadyInUse: () => context.l10n.emailAlreadyInUse,
                    operationNotAllowed: () => context.l10n.operationNotAllowed,
                    userDisabled: () => context.l10n.userDisabled,
                    userNotFound: () => context.l10n.userNotFound,
                    wrongPassword: () => context.l10n.wrongPassword,
                    tooManyRequests: () => context.l10n.tooManyRequests,
                    invalidEmailAndPasswordCombination: () =>
                        context.l10n.invalidEmailAndPasswordCombination,
                    invalidEmail: () => context.l10n.invalidEmail,
                  ),
                ),
              ),
            );
        }
      },
      child: const SignUpBody(),
    );
  }
}
