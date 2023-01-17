import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/setup/cubit/cubit.dart';
import 'package:meddly/features/setup/widgets/setup_body.dart';
import 'package:user/user.dart';

/// {@template setup_page}
/// A description for SetupPage
/// {@endtemplate}
class SetupPage extends StatelessWidget {
  /// {@macro setup_page}
  const SetupPage({super.key});

  /// The static route for SetupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SetupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetupCubit(GetIt.I.get<UserRepository>()),
      child: const Scaffold(
        body: SetupView(),
      ),
    );
  }
}

/// {@template setup_view}
/// Displays the Body of SetupView
/// {@endtemplate}
class SetupView extends StatelessWidget {
  /// {@macro setup_view}
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SetupBody();
  }
}
