import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/sign_up/widgets/sign_up_body.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context)
              .pushAndRemoveUntil(OnboardingPage.route(), (_) => false),
        ),
      ),
      body: const SignUpView(),
    );
  }
}

/// {@template sign_up_view}
/// Displays the Body of SignUpView
/// {@endtemplate}
class SignUpView extends ConsumerWidget {
  /// {@macro sign_up_view}
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (state.status.isSubmissionSuccess) {
    //   Navigator.of(context)
    //       .pushAndRemoveUntil(UserPage.route(), (_) => false);
    // }
    // if (state.status.isSubmissionFailure) {
    //   ScaffoldMessenger.of(context)
    //     ..hideCurrentSnackBar()
    //     ..showSnackBar(
    //       SnackBar(
    //         content: Text(
    //           state.failure!.maybeWhen(
    //             orElse: () => context.l10n.unknownError,
    //             accountsExistsWithDifferentCredentials: () =>
    //                 context.l10n.accountsExistsWithDifferentCredentials,
    //             serverError: () => context.l10n.serverError,
    //             emailAlreadyInUse: () => context.l10n.emailAlreadyInUse,
    //             operationNotAllowed: () => context.l10n.operationNotAllowed,
    //             userDisabled: () => context.l10n.userDisabled,
    //             userNotFound: () => context.l10n.userNotFound,
    //             wrongPassword: () => context.l10n.wrongPassword,
    //             tooManyRequests: () => context.l10n.tooManyRequests,
    //             invalidEmailAndPasswordCombination: () =>
    //                 context.l10n.invalidEmailAndPasswordCombination,
    //             invalidEmail: () => context.l10n.invalidEmail,
    //           ),
    //         ),
    //       ),
    //     );
    // }

    // TODO(lorenzo): listen to firebase auth to navigate or use navigator with riverpod

    ref.listen(authControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, stackTrace) => ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(err.toString()),
            ),
          ),
      );
    });

    return const SignUpBody();
  }
}
