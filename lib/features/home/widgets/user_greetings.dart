import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/home/provider/provider.dart';
import 'package:meddly/features/user/user.dart';

class UserGreetings extends ConsumerWidget {
  const UserGreetings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final greeting = ref.watch(greetingProvider);

    return Text.rich(
      TextSpan(
        text: '$greeting,\n',
        style: context.textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: user.fold(
              () => 'User',
              (user) {
                return '${user.firstName} 👋';
              },
            ),
            style: context.textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
