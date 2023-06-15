import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/helpers.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/onboarding/widgets/onboarding_body.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const String routeName = '/onboarding';

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

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

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

    return const OnboardingBody();
  }
}
