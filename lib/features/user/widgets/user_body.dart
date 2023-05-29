import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/user/user.dart';

class UserBody extends ConsumerWidget {
  const UserBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userControllerProvider);

    return userStream.when(
      data: (user) {
        if (user == null) {
          return const Text('No user');
        } else {
          return Center(child: Text(user.toString()));
        }
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Center(
          child: RepaintBoundary(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
