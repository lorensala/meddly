import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/user/user.dart';
import 'package:user/user.dart';

/// {@template user_page}
/// A description for UserPage
/// {@endtemplate}
class UserPage extends StatelessWidget {
  /// {@macro user_page}
  const UserPage({super.key});

  /// The static route for UserPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const UserPage());
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(
        api: GetIt.I.get<UserApi>(),
        cache: GetIt.I.get<UserCache>(),
      ),
      child: BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<UserRepository>(context)),
        child: const Scaffold(
          body: UserView(),
        ),
      ),
    );
  }
}

/// {@template user_view}
/// Displays the Body of UserView
/// {@endtemplate}
class UserView extends StatelessWidget {
  /// {@macro user_view}
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserBody();
  }
}
