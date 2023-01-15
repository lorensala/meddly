import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/auth/bloc/auth_bloc.dart';
import 'package:meddly/features/onboarding/view/onboarding_page.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = GetIt.I.get<AuthRepository>();
    final user = authRepository.currentUser;

    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: GetIt.I.get<AuthRepository>()),
      child: MaterialApp(
        theme: ThemeManager.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: user == null ? const OnboardingPage() : const UserPage(),
      ),
    );
  }
}
