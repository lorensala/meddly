import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/features/user/user.dart';

class SupervisedSelectionItem extends ConsumerWidget {
  const SupervisedSelectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supervised = ref.watch(supervisedProvider);
    final selected = ref.watch(selectedSupervisedProvider);
    final me = ref.watch(userProvider);

    return ListTile(
      onTap: () {
        ref.read(selectedSupervisedProvider.notifier).update(supervised);
        Navigator.of(context).pop();
      },
      selected: supervised == me || selected == supervised,
      trailing: supervised == me || selected == supervised
          ? Text('(YO)', style: context.textTheme.titleSmall)
          : null,
      leading: CircleAvatar(
        backgroundColor: context.colorScheme.primary,
        child: Text(
          '${supervised.firstName[0]}${supervised.lastName[0]}',
          style: context.textTheme.bodyMedium!
              .copyWith(color: context.colorScheme.onPrimary),
        ),
      ),
      title: Text('${supervised.firstName} ${supervised.lastName}'),
      subtitle: Text(supervised.email),
    );
  }
}
