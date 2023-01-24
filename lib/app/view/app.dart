import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/auth/bloc/auth_bloc.dart';
import 'package:meddly/features/onboarding/view/onboarding_page.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/theme/theme.dart';
import 'package:user/user.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = GetIt.I.get<AuthRepository>();
    final user = authRepository.currentUser;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              AuthBloc(authRepository: GetIt.I.get<AuthRepository>()),
        ),
        BlocProvider(
          create: (_) => UserBloc(
            userRepository: GetIt.I.get<UserRepository>(),
            authRepository: GetIt.I.get<AuthRepository>(),
          ),
        ),
        BlocProvider(
          create: (_) => PhoneBloc(
            authRepository: GetIt.I.get<AuthRepository>(),
            userRepository: GetIt.I.get<UserRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeManager.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: user == null ? const OnboardingPage() : const UserPage(),
      ),
    );
  }
}
