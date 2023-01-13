import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/onboarding/cubit/cubit.dart';
import 'package:meddly/features/onboarding/widgets/onboarding_body.dart';

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
    return const OnboardingBody();
  }
}
