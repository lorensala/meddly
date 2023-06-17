import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:notifications/notifications.dart';

class NotificationsFilters extends ConsumerWidget {
  const NotificationsFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(notificationSelectedTypesProvider);
    return Container(
      width: context.width,
      color: context.colorScheme.secondary,
      child: SizedBox(
        height: Sizes.filterChipHeight,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: NotificationType.values
              .map(
                (e) => CustomFilterChip(
                  type: e,
                  label: e.localizedString(context.l10n),
                  isSelected: selectedFilters.contains(e),
                  onSelect: () => ref
                      .read(notificationSelectedTypesProvider.notifier)
                      .select(e),
                  onUnselect: () => ref
                      .read(notificationSelectedTypesProvider.notifier)
                      .unselect(e),
                ),
              )
              .expand(
                (e) => [
                  e,
                  const SizedBox(width: Sizes.medium),
                ],
              )
              .take(NotificationFilter.values.length * 2 + 1)
              .toList(),
        ),
      ),
    );
  }
}
