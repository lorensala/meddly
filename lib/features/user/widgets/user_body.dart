import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/bloc/bloc.dart';
import 'package:meddly/features/phone/phone.dart';
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
                (_) => false,
              );
            }
            if (user.phone.isEmpty) {
              Navigator.of(context).pushAndRemoveUntil(
                PhonePage.route(),
                (_) => false,
              );
            }
          },
          failure: (failure) => failure.whenOrNull(
            notFound: () => context.read<AuthBloc>().state.whenOrNull(
                  authenticated: (_) async =>
                      Navigator.of(context).pushAndRemoveUntil(
                    SetupPage.route(),
                    (_) => false,
                  ),
                ),
          ),
        );
      },
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (failure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(failure.toString()),
                  const SizedBox(height: Sizes.mediumSpacing),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<UserBloc>().add(const UserEvent.logout()),
                    child: const Text('logout'),
                  ),
                ],
              ),
            );
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
