import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/appointment/view/view.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/notifications/view/view.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/view/view.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/features/setup/view/view.dart';
import 'package:meddly/features/splash/splash.dart';
import 'package:meddly/features/supervisor/view/view.dart';
import 'package:meddly/features/user/user.dart';
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
                parentNavigatorKey: shellNavigatorKey,
                path: AppointmentPage.routeName,
                builder: (context, state) => const AppointmentPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: '${AppointmentFormPage.routeName}/:id',
                    builder: (context, state) => const AppointmentFormPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: '${AppointmentDetailPage.routeName}/:id',
                    builder: (context, state) => AppointmentDetailPage(
                      int.parse(state.pathParameters['id']!),
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: MeasurementPage.routeName,
                parentNavigatorKey: shellNavigatorKey,
                builder: (context, state) => const MeasurementPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: MeasurementFormPage.routeName,
                    builder: (context, state) => const MeasurementFormPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: '${MeasurementDetailPage.routeName}/:id',
                    builder: (context, state) => MeasurementDetailPage(
                      int.parse(state.pathParameters['id']!),
                    ),
                  ),
                ],
              ),
              GoRoute(
                parentNavigatorKey: shellNavigatorKey,
                path: MedicinePage.routeName,
                builder: (context, state) => const MedicinePage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: MedicineNamePage.routeName,
                    builder: (context, state) => const MedicineNamePage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: MedicinePresentationPage.routeName,
                    builder: (context, state) =>
                        const MedicinePresentationPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: MedicineFrecuencyPage.routeName,
                    builder: (context, state) => const MedicineFrecuencyPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: MedicineDosisPage.routeName,
                    builder: (context, state) => const MedicineDosisPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: MedicineIntervalPage.routeName,
                    builder: (context, state) => const MedicineIntervalPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: MedicineHourPage.routeName,
                    builder: (context, state) => const MedicineHourPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: MedicineReviewDetailsPage.routeName,
                    builder: (context, state) =>
                        const MedicineReviewDetailsPage(),
                  ),
                ],
              ),
              GoRoute(
                path: SupervisorPage.routeName,
                parentNavigatorKey: shellNavigatorKey,
                builder: (context, state) => const SupervisorPage(),
              ),
              GoRoute(
                parentNavigatorKey: shellNavigatorKey,
                path: PredictionsPage.routeName,
                builder: (context, state) => const PredictionsPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: shellNavigatorKey,
                    path: PredictionSymptomsPage.routeName,
                    builder: (context, state) => const PredictionSymptomsPage(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: shellNavigatorKey,
                        path: PredictionsSymptomsSearchPage.routeName,
                        builder: (context, state) =>
                            const PredictionsSymptomsSearchPage(),
                      ),
                      GoRoute(
                        parentNavigatorKey: shellNavigatorKey,
                        path: PredictionResultsPage.routeName,
                        builder: (context, state) =>
                            const PredictionResultsPage(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            parentNavigatorKey: shellNavigatorKey,
            path: UserPage.routeName,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: UserPage()),
            routes: [
              GoRoute(
                parentNavigatorKey: shellNavigatorKey,
                path: NotificationsPreferencesPage.routeName,
                builder: (context, state) =>
                    const NotificationsPreferencesPage(),
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
    ],
  );

  ref.onDispose(router.dispose);
  return router;
}
