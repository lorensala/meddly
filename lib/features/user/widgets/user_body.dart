import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/features/auth/bloc/bloc.dart';
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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
            onPressed: () =>
                context.read<AuthBloc>().add(const LogoutRequestedEvent()),
            child: const Text('logout'),
          ),
        );
      },
    );
  }
}
