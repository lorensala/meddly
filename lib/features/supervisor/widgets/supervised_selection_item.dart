import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/calendar_selected_users_provider.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/theme/theme.dart';

class SupervisedSelectionItem extends ConsumerWidget {
  const SupervisedSelectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supervised = ref.watch(supervisedProvider);
    final selected = ref.watch(calendarSelectedUsersProvider);
    final me = ref.watch(userProvider);
    final isSelected = selected.contains(supervised);

    return ListTile(
      onTap: () {
        ref.read(calendarSelectedUsersProvider.notifier).update([
          ...selected,
          supervised,
        ]);
        // Navigator.of(context).pop();
      },
      selected: selected.contains(supervised),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (supervised == me)
            CircleAvatar(
              radius: Sizes.extraSmall,
              backgroundColor: context.colorScheme.success,
            ),
          Checkbox.adaptive(
            value: isSelected,
            activeColor: context.colorScheme.primary,
            onChanged: (value) {
              if (value == null) return;

              if (value) {
                ref.read(calendarSelectedUsersProvider.notifier).update([
                  ...selected,
                  supervised,
                ]);
              } else {
                ref.read(calendarSelectedUsersProvider.notifier).update([
                  ...selected.where((element) => element != supervised),
                ]);
              }
            },
          )
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: context.colorScheme.primary,
        child: Text(
          '${supervised.firstName[0]}${supervised.lastName[0]}',
          style: context.textTheme.bodyMedium!
              .copyWith(color: context.colorScheme.onPrimary),
        ),
      ),
      title: Text('${supervised.firstName} ${supervised.lastName}'),
      subtitle: Text(
        supervised.email,
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
    );
  }
}
