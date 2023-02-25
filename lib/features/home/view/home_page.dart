import 'package:flutter/material.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
    );
  }
}

/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
class HomeView extends ConsumerWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authStreamProvider, (_, state) {
      state.whenOrNull(
        data: (optionUser) {
          optionUser.fold(
            () => Navigator.of(context)
                .pushAndRemoveUntil(OnboardingPage.route(), (_) => false),
            (_) {},
          );
        },
      );
    });

    return const HomeBody();
  }
}
