import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/user/user.dart';
import 'package:user/user.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.userOrNull?.toString() ?? 'No user data'),
              ElevatedButton(
                onPressed: () =>
                    context.read<UserBloc>().add(const UserEvent.logout()),
                child: const Text('logout'),
              ),
              const SizedBox(height: Sizes.spacing),
              ElevatedButton(
                onPressed: () => context.read<UserBloc>().add(
                      UserEvent.createUser(
                        User(
                          uid: '1',
                          email: 'salalorenn@gmail.com',
                          firstName: 'Lorenzo',
                          lastName: 'Pichilli',
                          phone: '1234567890',
                          sex: const Sex.female(),
                          birth: DateTime(2000).toString(),
                        ),
                      ),
                    ),
                child: const Text('Create user'),
              ),
            ],
          ),
        );
      },
    );
  }
}
