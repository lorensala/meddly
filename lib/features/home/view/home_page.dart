import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/controller/auth_controller.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  static const String routeName = '/home';

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
      bottomNavigationBar: ColoredBox(
        color: context.colorScheme.background,
        child: SafeArea(
          child: Container(
            height: kBottomNavigationBarHeight,
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.onBackground.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -9),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [],
              ),
            ),
          ),
        ),
      ),
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
