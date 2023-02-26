import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/user/view/user_page.dart';

import '../provider/provider.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInitials = ref.watch(userInitialsProvider);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(UserPage.route()),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: context.colorScheme.primary,
        child: Text(
          userInitials,
          style: TextStyle(color: context.colorScheme.onPrimary),
        ),
      ),
    );
  }
}
