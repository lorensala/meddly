import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SupervisedList extends ConsumerWidget {
  const SupervisedList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(supervisorControllerProvider);

    return AsyncValueWidget(
      value: res,
      builder: (res) {
        if (res.supervised.isEmpty) {
          return EmptyContainer(
            message: context.l10n.supervisedEmptyMessage,
          );
        }

        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: res.supervised.map(
            (supervised) {
              return ProviderScope(
                overrides: [
                  supervisedProvider.overrideWithValue(supervised),
                ],
                child: const _SupervisedListItem(),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class _SupervisedListItem extends ConsumerWidget {
  const _SupervisedListItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supervised = ref.watch(supervisedProvider);

    return Dismissible(
      key: Key(supervised.uid),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(context.l10n.confirm),
            content: Text(
              context.l10n.supervisedConfrimation(supervised.firstName),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(context.l10n.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(context.l10n.delete),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) => ref
          .read(supervisorControllerProvider.notifier)
          .deleteSupervised(supervised.uid),
      background: ColoredBox(
        color: context.colorScheme.error,
        child: const Padding(
          padding: EdgeInsets.only(right: Sizes.medium),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: context.colorScheme.primary,
          child: Text(
            '${supervised.firstName[0]}${supervised.lastName[0]}',
            style: context.textTheme.bodyMedium!
                .copyWith(color: context.colorScheme.onPrimary),
          ),
        ),
        title: Text(
          '${supervised.firstName} ${supervised.lastName}',
        ),
        subtitle: Text(supervised.email),
      ),
    );
  }
}
