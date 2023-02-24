import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/auth/provider/auth_provider.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/setup/view/setup_page.dart';
import 'package:meddly/features/user/provider/user_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/theme/theme.dart';
import 'package:user/user.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final userExist = ref.watch(checkIfUserExistProvider);

    return MultiBlocProvider(
      providers: [
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
        home: user == null
            ? const OnboardingPage()
            : userExist
                ? const HomePage()
                : const SetupPage(),
      ),
    );
  }
}
