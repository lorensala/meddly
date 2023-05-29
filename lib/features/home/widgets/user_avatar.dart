import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/home/provider/provider.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInitials = ref.watch(userInitialsProvider);
    return CircleAvatar(
      backgroundColor: context.colorScheme.primary,
      radius: 16,
      child: Text(
        userInitials,
        style: context.textTheme.titleSmall!.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
