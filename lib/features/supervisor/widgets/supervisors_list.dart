import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SupervisorsList extends ConsumerWidget {
  const SupervisorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(supervisorControllerProvider);

    return AsyncValueWidget(
      value: res,
      builder: (res) {
        if (res.supervisors.isEmpty) {
          return EmptyContainer(
            message: context.l10n.supervisorEmptyMessage,
          );
        }

        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: res.supervisors.map(
            (supervisor) {
              return ProviderScope(
                overrides: [
                  supervisorProvider.overrideWithValue(supervisor),
                ],
                child: const _SupervisorListItem(),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class _SupervisorListItem extends ConsumerWidget {
  const _SupervisorListItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supervisor = ref.watch(supervisorProvider);

    return Dismissible(
      key: Key(supervisor.uid),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(context.l10n.confirm),
            content: Text(
              context.l10n.supervisorConfrimation(supervisor.firstName),
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
          .deleteSupervisor(supervisor.uid),
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
            '${supervisor.firstName[0]}${supervisor.lastName[0]}',
            style: context.textTheme.bodyMedium!
                .copyWith(color: context.colorScheme.onPrimary),
          ),
        ),
        title: Text(
          '${supervisor.firstName} ${supervisor.lastName}',
        ),
        subtitle: Text(supervisor.email),
      ),
    );
  }
}