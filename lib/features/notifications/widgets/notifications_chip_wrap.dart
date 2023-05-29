import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/features/notifications/provider/notifications_selected_chip_provider.dart';

class NotificationsChipWrap extends ConsumerWidget {
  const NotificationsChipWrap({
    super.key,
  });

  static const double _spacing = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(notificationSelectedChipProvider);
    return Container(
      width: context.width,
      color: context.colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Wrap(
          spacing: _spacing,
          children: NotificationFilter.values
              .map(
                (e) => NotificationsChip(
                  type: e,
                  isSelected: selected == e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
