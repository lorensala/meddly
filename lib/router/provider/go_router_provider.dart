import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/notifications/view/view.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/view/view.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/features/predictions/view/prediction_validate_page.dart';
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
  final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
  final browseNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Browse');
  final userNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'User');

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
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${AppointmentFormPage.routeName}/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id']!);
          if (id != null) {
            final appointment = ref
                .read(appointmentControllerProvider.notifier)
                .getAppointment(id);

            return ProviderScope(
              overrides: [
                existingAppointmentProvider.overrideWithValue(
                  appointment,
                ),
              ],
              child: const AppointmentFormPage(),
            );
          }
          return const AppointmentFormPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${MeasurementFormPage.routeName}/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id']!);

          if (id != null) {
            final measurement = ref
                .read(measurementControllerProvider.notifier)
                .getMeasurement(id);

            return ProviderScope(
              overrides: [
                existingMeasurementProvider.overrideWithValue(
                  measurement,
                ),
              ],
              child: const MeasurementFormPage(),
            );
          }
          return const MeasurementFormPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${MedicineNamePage.routeName}',
        builder: (context, state) => const MedicineNamePage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${MedicinePresentationPage.routeName}',
        builder: (context, state) => const MedicinePresentationPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${MedicineFrecuencyPage.routeName}',
        builder: (context, state) => const MedicineFrecuencyPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${MedicineDosisPage.routeName}',
        builder: (context, state) => const MedicineDosisPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${MedicineIntervalPage.routeName}',
        builder: (context, state) => const MedicineIntervalPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${MedicineHourPage.routeName}',
        builder: (context, state) => const MedicineHourPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/${MedicineReviewDetailsPage.routeName}',
        builder: (context, state) => const MedicineReviewDetailsPage(),
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: [
              GoRoute(
                path: HomePage.routeName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: browseNavigatorKey,
            routes: [
              GoRoute(
                parentNavigatorKey: browseNavigatorKey,
                path: BrowsePage.routeName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BrowsePage()),
                routes: [
                  GoRoute(
                    parentNavigatorKey: browseNavigatorKey,
                    path: AppointmentPage.routeName,
                    builder: (context, state) => const AppointmentPage(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: browseNavigatorKey,
                        path: '${AppointmentFormPage.routeName}/:id',
                        builder: (context, state) {
                          final id = int.tryParse(state.pathParameters['id']!);
                          if (id != null) {
                            final appointment = ref
                                .read(appointmentControllerProvider.notifier)
                                .getAppointment(id);

                            return ProviderScope(
                              overrides: [
                                existingAppointmentProvider.overrideWithValue(
                                  appointment,
                                ),
                              ],
                              child: const AppointmentFormPage(),
                            );
                          }
                          return const AppointmentFormPage();
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: MeasurementPage.routeName,
                    parentNavigatorKey: browseNavigatorKey,
                    builder: (context, state) => const MeasurementPage(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: browseNavigatorKey,
                        path: '${MeasurementFormPage.routeName}/:id',
                        builder: (context, state) {
                          final id = int.tryParse(state.pathParameters['id']!);

                          if (id != null) {
                            final measurement = ref
                                .read(measurementControllerProvider.notifier)
                                .getMeasurement(id);

                            return ProviderScope(
                              overrides: [
                                existingMeasurementProvider.overrideWithValue(
                                  measurement,
                                ),
                              ],
                              child: const MeasurementFormPage(),
                            );
                          }
                          return const MeasurementFormPage();
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    parentNavigatorKey: browseNavigatorKey,
                    path: MedicinePage.routeName,
                    builder: (context, state) => const MedicinePage(),
                  ),
                  GoRoute(
                    path: SupervisorPage.routeName,
                    parentNavigatorKey: browseNavigatorKey,
                    builder: (context, state) => const SupervisorPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: browseNavigatorKey,
                    path: PredictionsPage.routeName,
                    builder: (context, state) => const PredictionsPage(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: browseNavigatorKey,
                        path: '${PredictionValidatePage.routeName}/:id',
                        builder: (context, state) {
                          final id = int.tryParse(state.pathParameters['id']!);

                          if (id != null) {
                            final prediction = ref
                                .read(predictionsBySymptomsProvider.notifier)
                                .getPrediction(id);

                            if (prediction == null) return const SizedBox();

                            return ProviderScope(
                              overrides: [
                                predictionProvider.overrideWithValue(
                                  prediction,
                                ),
                              ],
                              child: const PredictionValidatePage(),
                            );
                          }

                          return const PredictionValidatePage();
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: browseNavigatorKey,
                        path: PredictionSymptomsPage.routeName,
                        builder: (context, state) =>
                            const PredictionSymptomsPage(),
                      ),
                      GoRoute(
                        parentNavigatorKey: browseNavigatorKey,
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
          StatefulShellBranch(
            navigatorKey: userNavigatorKey,
            routes: [
              GoRoute(
                parentNavigatorKey: userNavigatorKey,
                path: UserPage.routeName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: UserPage()),
                routes: [
                  GoRoute(
                    parentNavigatorKey: userNavigatorKey,
                    path: NotificationsPreferencesPage.routeName,
                    builder: (context, state) =>
                        const NotificationsPreferencesPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: userNavigatorKey,
                    path: UserFormPage.routeName,
                    builder: (context, state) => const UserFormPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(navigationShell: child);
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
