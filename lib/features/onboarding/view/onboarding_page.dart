import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/onboarding/cubit/cubit.dart';
import 'package:meddly/features/onboarding/widgets/onboarding_body.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template onboarding_page}
/// A description for OnboardingPage
/// {@endtemplate}
class OnboardingPage extends StatelessWidget {
  /// {@macro onboarding_page}
  const OnboardingPage({super.key});

  /// The static route for OnboardingPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const OnboardingPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(GetIt.I<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(),
        body: const OnboardingView(),
      ),
    );
  }
}

/// {@template onboarding_view}
/// Displays the Body of OnboardingView
/// {@endtemplate}
class OnboardingView extends StatelessWidget {
  /// {@macro onboarding_view}
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (failure) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                failure.maybeMap(
                  cancelledByUser: (_) => context.l10n.cancelledByUser,
                  serverError: (_) => context.l10n.serverError,
                  userDisabled: (_) => context.l10n.userDisabled,
                  orElse: () => context.l10n.unknownError,
                ),
              ),
            ),
          ),
          success: () =>
              Navigator.of(context).pushReplacement(UserPage.route()),
        );
      },
      child: const OnboardingBody(),
    );
  }
}
