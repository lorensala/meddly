import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/auth/bloc/auth_bloc.dart';
import 'package:meddly/features/user/view/user_page.dart';
import 'package:meddly/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: GetIt.I.get<AuthRepository>()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF13B9FF),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const UserPage(),
          );
        },
      ),
    );
  }
}
