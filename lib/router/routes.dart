import 'package:go_router/go_router.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/setup/view/view.dart';
import 'package:meddly/features/splash/splash.dart';

final routes = [
  GoRoute(
    path: SetupNamePage.routeName,
    builder: (context, state) => const SetupNamePage(),
  ),
  GoRoute(
    path: SetupBirthdatePage.routeName,
    builder: (context, state) => const SetupBirthdatePage(),
  ),
  GoRoute(
    path: SetupSexPage.routeName,
    builder: (context, state) => const SetupSexPage(),
  ),
  GoRoute(
    path: SetupHeightWeightPage.routeName,
    builder: (context, state) => const SetupHeightWeightPage(),
  ),
  GoRoute(
    path: PhonePage.routeName,
    builder: (context, state) => const PhonePage(),
  ),
  GoRoute(
    path: SetupSuccessPage.routeName,
    builder: (context, state) => const SetupSuccessPage(),
  ),
  GoRoute(
    path: HomePage.routeName,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: OnboardingPage.routeName,
    builder: (context, state) => const OnboardingPage(),
  ),
  GoRoute(
    path: SplashPage.routeName,
    builder: (context, state) => const SplashPage(),
  ),
];
