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
      onRetry: () => ref.read(supervisorControllerProvider.notifier).refresh(),
      builder: (res) {
        if (res.supervisors.isEmpty) {
          return EmptyContainer(
            message: context.l10n.supervisorEmptyMessage,
          );
        }

        return RefreshIndicator(
          onRefresh: () async =>
              ref.read(supervisorControllerProvider.notifier).refresh(),
          child: ListView(
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
          ),
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
      background: const DismissibleDeleteBackground(),
      child: ListTile(
        leading: UserCircleAvatar(
          user: supervisor,
          radius: Sizes.medium + Sizes.extraSmall,
        ),
        title: Text(
          '${supervisor.firstName} ${supervisor.lastName}',
        ),
        subtitle: Text(supervisor.email),
      ),
    );
  }
}
