import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/features/auth/bloc/bloc.dart';
import 'package:meddly/features/onboarding/onboarding.dart';
import 'package:meddly/features/user/user.dart';

/// {@template user_page}
/// A description for UserPage
/// {@endtemplate}
class UserPage extends StatefulWidget {
  /// {@macro user_page}
  const UserPage({super.key});

  /// The static route for UserPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const UserPage());
  }

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(const UserEvent.checkIfUserExists());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserView(),
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          unauthenticated: () => Navigator.of(context)
              .pushAndRemoveUntil(OnboardingPage.route(), (_) => false),
        );
      },
      child: const UserBody(),
    );
  }
}
