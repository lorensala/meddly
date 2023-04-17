import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/home/view/view.dart';
import 'package:meddly/features/notifications/view/view.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/view/view.dart';
import 'package:meddly/features/setup/view/view.dart';
import 'package:meddly/features/splash/splash.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@riverpod
// ignore: unsupported_provider_value
GoRouter goRouter(GoRouterRef ref) {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
      initialLocation: SplashPage.routeName,
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SetupNamePage.routeName,
          builder: (context, state) => const SetupNamePage(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SetupBirthdatePage.routeName,
          builder: (context, state) => const SetupBirthdatePage(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SetupSexPage.routeName,
          builder: (context, state) => const SetupSexPage(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SetupHeightWeightPage.routeName,
          builder: (context, state) => const SetupHeightWeightPage(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: PhonePage.routeName,
          builder: (context, state) => const PhonePage(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SetupSuccessPage.routeName,
          builder: (context, state) => const SetupSuccessPage(),
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: HomePage.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomePage()),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: BrowsePage.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: BrowsePage()),
            ),
          ],
          builder: (context, state, child) {
            return HomeShell(child: child);
          },
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: OnboardingPage.routeName,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SplashPage.routeName,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: NotificationsPage.routeName,
          builder: (context, state) => const NotificationsPage(),
        ),
      ]);
}
