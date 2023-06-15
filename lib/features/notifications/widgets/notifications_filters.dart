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
    return Container(
      width: context.width,
      color: context.colorScheme.secondary,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FilterChips(),
          Divider(),
          _TypeChips(),
        ],
      ),
    );
  }
}

class _TypeChips extends ConsumerWidget {
  const _TypeChips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTypes = ref.watch(notificationSelectedTypesProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
      child: Wrap(
        spacing: Sizes.medium,
        children: NotificationType.values
            .map(
              (e) => CustomFilterChip(
                type: e,
                label: e.localizedString(context.l10n),
                isSelected: selectedTypes.contains(e),
                onSelect: () => ref
                    .read(notificationSelectedTypesProvider.notifier)
                    .select(e),
                onUnselect: () => ref
                    .read(notificationSelectedTypesProvider.notifier)
                    .unselect(e),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _FilterChips extends ConsumerWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(notificationSelectedFiltersProvider);
    return SizedBox(
      height: Sizes.filterChipHeight,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: NotificationFilter.values
            .map(
              (e) => CustomFilterChip(
                type: e,
                label: e.localizedString(context.l10n),
                isSelected: selectedFilters.contains(e),
                onSelect: () => ref
                    .read(notificationSelectedFiltersProvider.notifier)
                    .select(e),
                onUnselect: () => ref
                    .read(notificationSelectedFiltersProvider.notifier)
                    .unselect(e),
              ),
            )
            .expand(
              (e) => [
                e,
                const SizedBox(width: Sizes.medium),
              ],
            )
            .take(NotificationFilter.values.length * 2 - 1)
            .toList(),
      ),
    );
  }
}
