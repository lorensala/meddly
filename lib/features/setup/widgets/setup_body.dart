import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/features/setup/cubit/cubit.dart';
import 'package:meddly/features/user/user.dart';

/// {@template setup_body}
/// Body of the SetupPage.
///
/// Add what it does
/// {@endtemplate}
class SetupBody extends StatelessWidget {
  /// {@macro setup_body}
  const SetupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('SetupPage'),
              ElevatedButton(
                onPressed: () =>
                    context.read<UserBloc>().add(const UserEvent.logout()),
                child: const Text('logout'),
              ),
            ],
          ),
        );
      },
    );
  }
}
