import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/login/cubit/login_cubit.dart';
import 'package:meddly/features/login/widgets/login_body.dart';
import 'package:meddly/features/onboarding/view/onboarding_page.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template login_page}
/// A description for LoginPage
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro login_page}
  const LoginPage({super.key});

  /// The static route for LoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(GetIt.I.get<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context)
                .pushAndRemoveUntil(OnboardingPage.route(), (_) => false),
          ),
        ),
        body: const LoginView(),
      ),
    );
  }
}

/// {@template login_view}
/// Displays the Body of LoginView
/// {@endtemplate}
class LoginView extends StatelessWidget {
  /// {@macro login_view}
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
      child: const LoginBody(),
    );
  }
}
