import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/core/core.dart';
import 'package:meddly/features/notifications/provider/notifications_selected_chip_provider.dart';

class NotificationsChip extends ConsumerWidget {
  const NotificationsChip({
    required this.type,
    super.key,
    this.isSelected = false,
  });

  final NotificationFilter type;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilterChip(
      selected: isSelected,
      showCheckmark: false,
      label: Text(type.name),
      shape: StadiumBorder(
        side: BorderSide(
          color: context.colorScheme.primary.withOpacity(0.5),
        ),
      ),
      onSelected: (bool value) {
        ref.read(notificationSelectedChipProvider.notifier).select(type);
      },
    );
  }
}
