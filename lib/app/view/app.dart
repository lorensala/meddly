import 'package:flutter/material.dart';
import 'package:meddly/features/auth/provider/auth_provider.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/splash/view/splash_page.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return MaterialApp(
        theme: ThemeManager.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: user == null ? const OnboardingPage() : SplashPage());
  }
}
