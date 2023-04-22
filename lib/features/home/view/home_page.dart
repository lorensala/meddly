import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (_, state) {
      state.whenOrNull(
        data: (user) {
          if (user == null) {
            context.go(OnboardingPage.routeName);
          }
        },
      );
    });

    return const HomeBody();
  }
}
