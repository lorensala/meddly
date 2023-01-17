import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/features/auth/bloc/bloc.dart';
import 'package:meddly/features/setup/view/setup_page.dart';
import 'package:meddly/features/user/user.dart';

/// {@template user_body}
/// Body of the UserPage.
///
/// Add what it does
/// {@endtemplate}
class UserBody extends StatelessWidget {
  /// {@macro user_body}
  const UserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (user) {
            if (user.firstName.isEmpty) {
              Navigator.of(context).pushAndRemoveUntil(
                SetupPage.route(),
                (route) => false,
              );
            }
          },
          failure: (failure) => failure.whenOrNull(
            notFound: () => context.read<AuthBloc>().state.whenOrNull(
                  authenticated: (_) async =>
                      Navigator.of(context).pushAndRemoveUntil(
                    SetupPage.route(),
                    (route) => false,
                  ),
                ),
          ),
        );
      },
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (failure) {
            return Center(child: Text(failure.toString()));
          },
          success: (user) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(user.toString()),
                ElevatedButton(
                  onPressed: () =>
                      context.read<UserBloc>().add(const UserEvent.logout()),
                  child: const Text('logout'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
