import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/notifications/view/view.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/view/view.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/features/setup/view/view.dart';
import 'package:meddly/features/splash/splash.dart';
import 'package:meddly/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@riverpod
Raw<GoRouter> goRouter(GoRouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  final router = GoRouter(
    initialLocation: SplashPage.routeName,
    navigatorKey: rootNavigatorKey,
    observers: [
      GoRouterObserver(),
    ],
    routes: [
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SetupNamePage.routeName,
        builder: (context, state) => const SetupNamePage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SetupBirthdatePage.routeName,
        builder: (context, state) => const SetupBirthdatePage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SetupSexPage.routeName,
        builder: (context, state) => const SetupSexPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SetupHeightWeightPage.routeName,
        builder: (context, state) => const SetupHeightWeightPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: PhonePage.routeName,
        builder: (context, state) => const PhonePage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SetupSuccessPage.routeName,
        builder: (context, state) => const SetupSuccessPage(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        routes: [
          GoRoute(
            parentNavigatorKey: shellNavigatorKey,
            path: HomePage.routeName,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomePage()),
          ),
          GoRoute(
            parentNavigatorKey: shellNavigatorKey,
            path: BrowsePage.routeName,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BrowsePage()),
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: MedicinePage.routeName,
                builder: (context, state) => const MedicinePage(),
              ),
            ],
          ),
        ],
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: OnboardingPage.routeName,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SplashPage.routeName,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: NotificationsPage.routeName,
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: PredictionsPage.routeName,
        builder: (context, state) => const PredictionsPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: PredictionSymptomsPage.routeName,
        builder: (context, state) => const PredictionSymptomsPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: PredictionsSymptomsSearchPage.routeName,
        builder: (context, state) => const PredictionsSymptomsSearchPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: PredictionResultsPage.routeName,
        builder: (context, state) => const PredictionResultsPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MedicineNamePage.routeName,
        builder: (context, state) => const MedicineNamePage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MedicinePresentationPage.routeName,
        builder: (context, state) => const MedicinePresentationPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MedicineFrecuencyPage.routeName,
        builder: (context, state) => const MedicineFrecuencyPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MedicineDosisPage.routeName,
        builder: (context, state) => const MedicineDosisPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MedicineIntervalPage.routeName,
        builder: (context, state) => const MedicineIntervalPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MedicineHourPage.routeName,
        builder: (context, state) => const MedicineHourPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MedicineReviewDetailsPage.routeName,
        builder: (context, state) => const MedicineReviewDetailsPage(),
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
}
