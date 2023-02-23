import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/auth/auth.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: const OnboardingView(),
    );
  }
}

/// {@template onboarding_view}
/// Displays the Body of OnboardingView
/// {@endtemplate}
class OnboardingView extends ConsumerWidget {
  /// {@macro onboarding_view}
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (_, state) {
      state.whenOrNull(
        //TODO(lorenzo): navigate ... data: (data) => Navigate.toHome(),
        error: (err, stackTrace) => ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(err.toString()),
            ),
          ),
      );
    });

    return const OnboardingBody();
  }
}
