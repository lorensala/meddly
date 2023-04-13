import 'package:go_router/go_router.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/setup/view/setup_page.dart';
import 'package:meddly/features/splash/splash.dart';

final routes = [
  GoRoute(
    path: SetupPage.routeName,
    builder: (context, state) => SetupPage(),
  ),
  GoRoute(
    path: PhonePage.routeName,
    builder: (context, state) => PhonePage(),
  ),
  GoRoute(
    path: HomePage.routeName,
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: OnboardingPage.routeName,
    builder: (context, state) => OnboardingPage(),
  ),
  GoRoute(
    path: SplashPage.routeName,
    builder: (context, state) => SplashPage(),
  ),
];
